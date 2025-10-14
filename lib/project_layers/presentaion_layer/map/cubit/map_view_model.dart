import 'dart:async';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'map_states.dart';
import '../../../../core/utils/svg_to_icon.dart';
import '../../../../core/map/map_utils.dart';
import '../../../firebase_layer/firestore_manager.dart';
import '../../../firebase_layer/models/orders_response_dto.dart';
import '../../../api_layer/api_client/google_maps_api_client.dart';

@injectable
class MapViewModel extends Cubit<MapStates> {
  late String orderId;
  final GoogleMapsApiClient googleMapsApiClient;

  StreamSubscription<OrdersDto?>?
  _orderStreamSubscription;

  MapViewModel({
   required  this.googleMapsApiClient,
  }) :
       super(MapInitialState()) {
    // Start listening to Firebase stream
  }

  GoogleMapController? _mapController;

  // Google Maps API Key
  static final String _googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  List<LatLng> _routePoints =
      []; // Store the actual route from Directions API

  double _deliveryPersonRotation =
      0.0; // زاوية دوران الموتوسيكل (بالدرجات)

  // تعديل زاوية الدوران حسب اتجاه الصورة الأصلية
  // إذا كانت الصورة تواجه الشرق (90°)، نطرح 90
  // إذا كانت تواجه الجنوب (180°)، نطرح 180
  // إذا كانت تواجه الغرب (270°)، نطرح 270
  // إذا كان الموتوسيكل يتحرك بظهره، نضيف 180 أو نغير الإشارة
  static const double _iconRotationOffset =
      -90.0; // تعديل حسب اتجاه الصورة (تغير من 90 إلى -90)

  // Sample delivery data - replace with your actual data source
  // نقطة البداية - من Firebase (Flowery Store)
  LatLng? _sourceLocation;

  // نقطة النهاية - من Firebase (User destination)
  LatLng? _destinationLocation;

  // موقع عامل التوصيل - من Firebase (Driver location)
  LatLng? _deliveryPersonLocation;

  String _deliveryPersonName = "Loading...";
  String _estimatedArrival = "Calculating...";
  double _distanceKm = 0.0;
  String _driverPhoneNo = '';

  // 🔥 Listen to Firebase order updates
  void listenToOrderUpdates(String orderId) {
    emit(MapLoadingState());

    _orderStreamSubscription =
        FirebaseUtils.fetchOrderFromFirebase(
          orderId: orderId,
        ).listen(
          (orderData) async {
            if (orderData == null) {
              emit(MapErrorState('Order not found'));
              return;
            }

            _driverPhoneNo =
                orderData.driver?.phone ?? '';
            // 📍 استخراج بيانات الموقع من Firebase
            final bool onlyDriverChanged =
                await _extractLocationsFromOrder(
                  orderData,
                );

            // 🗺️ تحميل بيانات الخريطة فقط إذا لم يكن التغيير في موقع السائق فقط
            if (onlyDriverChanged) {
              // تحديث السائق فقط بدون إعادة تحميل الخريطة بالكامل
              await _updateDeliveryPersonMarker();
            } else {
              // إعادة تحميل الخريطة بالكامل (أول مرة أو تغييرات أخرى)
              await _loadMapData();
            }
          },
          onError: (error) {
            emit(
              MapErrorState(
                'Failed to load order data: $error',
              ),
            );
          },
        );
  }

  // 📍 استخراج المواقع من بيانات الطلب
  /// Returns true if only driver location changed (no need to reload entire map)
  Future<bool> _extractLocationsFromOrder(
    OrdersDto orderData,
  ) async {
    // 🏪 Store location (source - Flowery)
    if (orderData.store?.latLong != null) {
      _sourceLocation = orderData.store!.latLong;
    }

    // 🏍️ Driver location (delivery person) - يتحدث مباشرة من Firebase
    final LatLng? newDriverLocation =
        _parseDriverLocation(orderData);

    bool onlyDriverLocationChanged = false;

    if (newDriverLocation != null) {
      // 🔄 التحقق من تغيير موقع السائق
      final bool driverLocationChanged =
          _deliveryPersonLocation == null ||
          (_deliveryPersonLocation!.latitude !=
                  newDriverLocation.latitude ||
              _deliveryPersonLocation!.longitude !=
                  newDriverLocation.longitude);


      if (driverLocationChanged) {
        _deliveryPersonLocation = newDriverLocation;
        _deliveryPersonName =
            '${orderData.driver!.firstName ?? ''} ${orderData.driver!.lastName ?? ''}'
                .trim();

        // ✅ إذا كانت الخريطة محملة بالفعل، علّم أن التغيير فقط في موقع السائق
        if (state is MapLoadedState) {
          onlyDriverLocationChanged = true;
          print(
            '✅ Map already loaded - will update driver marker only',
          );
        }
      }
    }

    // 🏠 Destination location - استخدام موقع الجهاز الفعلي
    _destinationLocation = LatLng(
      31.250651173759678,
      29.969974246069924,
    );

    // 🧭 حساب اتجاه الموتوسيكل نحو موقع المستخدم (الوجهة)
    if (_deliveryPersonLocation != null &&
        _destinationLocation != null) {
      _deliveryPersonRotation = MapUtils.calculateBearing(
        _deliveryPersonLocation!,
        _destinationLocation!,
      );
    }

    // تحديث معلومات إضافية
    _estimatedArrival = orderData.createdAt ?? 'Unknown';

    // حساب المسافة التقريبية
    if (_sourceLocation != null &&
        _destinationLocation != null) {
      // 🔧 استخدام MapUtils لحساب المسافة
      _distanceKm =
          MapUtils.calculateDistance(
            _sourceLocation!.latitude,
            _sourceLocation!.longitude,
            _destinationLocation!.latitude,
            _destinationLocation!.longitude,
          ) /
          1000; // تحويل من متر إلى كيلومتر
    }

    // 🎯 إرجاع علامة إذا كان التغيير فقط في موقع السائق
    // سيتم استخدامها في _listenToOrderUpdates لتقرير ما إذا كان يجب إعادة تحميل الخريطة
    return onlyDriverLocationChanged;
  }

  // 🔍 دالة مساعدة لاستخراج موقع السائق
  LatLng? _parseDriverLocation(OrdersDto orderData) {
    if (orderData.driver?.lat != null &&
        orderData.driver?.long != null) {
      try {
        final lat = double.parse(orderData.driver!.lat!);
        final long = double.parse(
          orderData.driver!.long!,
        );
        return LatLng(lat, long);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _animateToFitMarkers();
    // ❌ تم إزالة _startLocationUpdates() لأن Firebase Stream سيتولى التحديثات
  }

  Future<void> _loadMapData() async {
    // ✅ التحقق من أن جميع المواقع متاحة قبل رسم الخريطة
    if (_sourceLocation == null ||
        _destinationLocation == null ||
        _deliveryPersonLocation == null) {
      emit(MapLoadingState());
      return;
    }

    emit(MapLoadingState());

    try {
      // Create custom markers
      final Set<Marker> markers = {};

      // � Create custom store icon
      final storeIcon = await _createStoreIcon();

      // 🏠 Create custom user/destination icon
      final userIcon = await _createUserIcon();

      // �🏍️ Create custom motorcycle delivery icon
      final deliveryIcon = await _createDeliveryIcon();

      // Add store marker with custom icon
      markers.add(
        Marker(
          markerId: const MarkerId('source'),
          position: _sourceLocation!,
          icon: storeIcon, // 🎨 Custom store icon
          infoWindow: const InfoWindow(
            title: 'Flowery',
            snippet: 'Pickup location',
          ),
        ),
      );

      // Add user/destination marker with custom icon
      markers.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: _destinationLocation!,
          icon: userIcon, // 🎨 Custom user icon
          infoWindow: const InfoWindow(
            title: 'Apartment',
            snippet: 'Delivery location',
          ),
        ),
      );

      // Add driver marker with custom icon
      markers.add(
        Marker(
          markerId: const MarkerId('delivery_person'),
          position: _deliveryPersonLocation!,
          icon: deliveryIcon, // 🎨 Custom delivery icon
          rotation:
              _deliveryPersonRotation -
              _iconRotationOffset, // 🧭 تدوير مع تعديل اتجاه الصورة الأصلية
          flat:
              true, // 🔒 منع دوران الأيقونة عند تدوير الخريطة
          anchor: const Offset(
            0.5,
            0.5,
          ), // مركز الدوران في منتصف الأيقونة
          infoWindow: InfoWindow(
            title: _deliveryPersonName,
            snippet: 'Your delivery person',
          ),
        ),
      );

      // Create route polylines
      final Set<Polyline> polylines = {};

      // If we have route points from Directions API, use them
      if (_routePoints.isEmpty) {
        // Initialize route points from source to destination
        await _fetchDirectionsRoute();
      }

      // ✨ رسم مسار وردي واحد متصل من البداية للنهاية
      if (_routePoints.isNotEmpty &&
          _routePoints.length > 1) {
        polylines.add(
          Polyline(
            polylineId: const PolylineId('main_route'),
            points:
                _routePoints, // المسار الكامل من البداية للنهاية
            color: const Color(0xFFD21E6A), // وردي
            width: 5,
            geodesic: true, // لجعل الخط يتبع انحناء الأرض
          ),
        );      }

      emit(
        MapLoadedState(
          markers: markers,
          polylines: polylines,
          currentLocation: _sourceLocation!,
          destinationLocation: _destinationLocation!,
          deliveryPersonLocation:
              _deliveryPersonLocation!,
          estimatedArrival: _estimatedArrival,
          distanceKm: _distanceKm,
          deliveryPersonName: _deliveryPersonName,
          driverPhoneNo: _driverPhoneNo,
        ),
      );

    } catch (e) {
      emit(
        MapErrorState(
          'Failed to load map: ${e.toString()}',
        ),
      );
    }
  }

  // 🗺️ دالة لجلب المسار الحقيقي من Google Directions API
  Future<void> _fetchDirectionsRoute() async {
    if (_sourceLocation == null ||
        _destinationLocation == null) {
      return;
    }

    try {
      final origin =
          '${_sourceLocation!.latitude},${_sourceLocation!.longitude}';
      final destination =
          '${_destinationLocation!.latitude},${_destinationLocation!.longitude}';

      // 🔥 Using GoogleMapsApiClient (Retrofit)
      final response = await googleMapsApiClient
          .getDirections(
            origin: origin,
            destination: destination,
            mode: 'driving',
            key: _googleApiKey,
          );

      if (response.status == 'OK' &&
          response.routes != null &&
          response.routes!.isNotEmpty) {
        // استخراج الـ polyline المشفر
        final encodedPolyline =
            response.routes![0].overviewPolyline?.points;

        if (encodedPolyline != null) {
          // 🔧 فك تشفير الـ polyline باستخدام MapUtils
          _routePoints = MapUtils.decodePolyline(
            encodedPolyline,
          );
        }
      } else {
        throw Exception(
          'Directions API error: ${response.status} - ${response.errorMessage}',
        );
      }
    } catch (e) {
      rethrow; // رفع الخطأ لكي يظهر للمستخدم
    }
  }

  void _animateToFitMarkers() {
    if (_mapController == null ||
        _sourceLocation == null ||
        _destinationLocation == null ||
        _deliveryPersonLocation == null) {
      return;
    }

    // 🔧 استخدام MapUtils لحساب الحدود
    final bounds = MapUtils.calculateBounds([
      _sourceLocation!,
      _destinationLocation!,
      _deliveryPersonLocation!,
    ]);

    _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 100.0),
    );
  }

  void refreshLocation() {
    _loadMapData();
  }

  // 🔄 دالة لتحديث موقع عامل التوصيل فقط (بدون إعادة رسم الخريطة)
  Future<void> _updateDeliveryPersonMarker() async {
    if (state is! MapLoadedState ||
        _deliveryPersonLocation == null) {
      return;
    }
    final currentState = state as MapLoadedState;
    final updatedMarkers = Set<Marker>.from(
      currentState.markers,
    );

    // إزالة الماركر القديم لعامل التوصيل
    updatedMarkers.removeWhere(
      (marker) =>
          marker.markerId.value == 'delivery_person',
    );

    // إنشاء ماركر جديد بالموقع المحدث
    final deliveryIcon = await _createDeliveryIcon();
    updatedMarkers.add(
      Marker(
        markerId: const MarkerId('delivery_person'),
        position: _deliveryPersonLocation!,
        icon: deliveryIcon,
        rotation:
            _deliveryPersonRotation -
            _iconRotationOffset, // 🧭 تدوير مع تعديل اتجاه الصورة الأصلية
        flat:
            true, // 🔒 منع دوران الأيقونة عند تدوير الخريطة
        anchor: const Offset(
          0.5,
          0.5,
        ), // مركز الدوران في منتصف الأيقونة
        infoWindow: InfoWindow(
          title: _deliveryPersonName,
          snippet: 'Your delivery person',
        ),
      ),
    );

    // تحديث الحالة بالماركرز الجديدة فقط
    emit(
      MapLoadedState(
        markers: updatedMarkers,
        polylines: currentState.polylines, // نفس الخطوط
        currentLocation: currentState.currentLocation,
        destinationLocation:
            currentState.destinationLocation,
        deliveryPersonLocation:
            _deliveryPersonLocation!, // الموقع الجديد
        estimatedArrival: currentState.estimatedArrival,
        distanceKm: currentState.distanceKm,
        deliveryPersonName:
            currentState.deliveryPersonName,
        driverPhoneNo: currentState.driverPhoneNo,
      ),
    );
    print('✅ Driver marker update completed');
  }

  // � دالة لإنشاء أيقونة المتجر المخصصة
  Future<BitmapDescriptor> _createStoreIcon() async {
    try {
      final icon = await SvgToIcon.fromPngAsset(
        'assets/images/store_icon_map.png',
        width: 100, // حجم مناسب للمتجر
        imageScale: 4.0,
      );
      return icon;
    } catch (e) {
      return BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueGreen,
      );
    }
  }

  // 🏠 دالة لإنشاء أيقونة المستخدم/الوجهة المخصصة
  Future<BitmapDescriptor> _createUserIcon() async {
    try {
      final icon = await SvgToIcon.fromPngAsset(
        Assets.images.userIconMap.path,
        width: 100, // حجم مناسب للمستخدم
        imageScale: 4.0,
      );
      return icon;
    } catch (e) {
      return BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      );
    }
  }

  // �🏍️ دالة لإنشاء أيقونة مخصصة من الأصول
  Future<BitmapDescriptor> _createDeliveryIcon() async {
    try {
      // استخدام صورة PNG عالية الجودة من مجلد images
      // حجم العرض: 80 بكسل على الخريطة (حجم مناسب للرؤية الواضحة)
      // imageScale: 3.0 للحصول على جودة عالية مع أداء جيد
      final icon = await SvgToIcon.fromPngAsset(
       Assets.images.motorcycleDelivery.path,
        width:
            65, // حجم العرض النهائي على الخريطة (أكبر للوضوح)
        imageScale:
            4.0, // معامل الجودة (4.03x = high quality)
      );
      return icon;
    } catch (e) {
      // Fallback to default marker
      return BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor
            .hueAzure, // لون مميز للدراجة النارية
      );
    }
  }

  @override
  Future<void> close() {
    _orderStreamSubscription?.cancel();
    return super.close();
  }
}
