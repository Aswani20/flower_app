import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapStates {}

class MapInitialState extends MapStates {}

class MapLoadingState extends MapStates {}

class MapLoadedState extends MapStates {
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final LatLng currentLocation;
  final LatLng destinationLocation;
  final LatLng deliveryPersonLocation;
  final String estimatedArrival;
  final double distanceKm;
  final String deliveryPersonName;
  final String driverPhoneNo;

  MapLoadedState({
    required this.markers,
    required this.polylines,
    required this.currentLocation,
    required this.destinationLocation,
    required this.deliveryPersonLocation,
    required this.estimatedArrival,
    required this.distanceKm,
    required this.deliveryPersonName,
    required this.driverPhoneNo,
  });
}

class MapErrorState extends MapStates {
  final String error;

  MapErrorState(this.error);
}

class MapLocationUpdatedState extends MapStates {
  final LatLng newLocation;

  MapLocationUpdatedState(this.newLocation);
}
