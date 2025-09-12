import 'dart:convert';
import 'package:flower_app/project_layers/api_layer/models/city_model.dart';
import 'package:flower_app/project_layers/api_layer/models/governorate_model.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static Future<LatLng?> getCurrentLocation() async {
    final status = await Permission.locationWhenInUse
        .request();
    if (status.isGranted) {
      final position =
          await Geolocator.getCurrentPosition(
            locationSettings: LocationSettings(
              accuracy: LocationAccuracy.high,
              distanceFilter: 100,
            ),
          );
      return LatLng(
        position.latitude,
        position.longitude,
      );
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return null;
  }

  static Future<String> getLocationDetails(
    LatLng location,
  ) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(
          location.latitude,
          location.longitude,
        );
    print(placemarks);
    return "${placemarks[0].street!}, ${placemarks[0].locality!}, ${placemarks[0].administrativeArea!}";
  }

  static Future<List<Governorate>> getGovernorates() async {
    final String governoratesJson = await rootBundle
        .loadString('assets/json/governorates.json');
    final List<dynamic> governoratesList = json.decode(governoratesJson);
    return governoratesList
        .map((json) => Governorate.fromJson(json))
        .toList();
  }

  static Future<List<City>> getCities() async {
    final String citiesJson = await rootBundle
        .loadString('assets/json/cities.json');
    final List<dynamic> citiesList = json.decode(citiesJson);
    return citiesList
        .map((json) => City.fromJson(json))
        .toList();
  }

  static Future<List<City>> getCitiesByGovernorate(
    String governorateId,
  ) async {
    final cities = await getCities();
    return cities.where(
      (city) => city.governorateId == governorateId,
    ).toList();
  }
}
