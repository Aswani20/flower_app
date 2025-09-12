import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddAddressLoading extends AddressState {}

class AddAddressSuccess extends AddressState {}

class AddAddressFailure extends AddressState {
  final String error;

  AddAddressFailure(this.error);
}

class LocationLoaded extends AddressState {
  final LatLng? position;
  LocationLoaded({this.position});
}

class LocationLoading extends AddressState {
  LocationLoading();
}

class LocationFailure extends AddressState {
  final String error;

  LocationFailure(this.error);
}


class GetAddressLoading extends AddressState {}

class GetAddressSuccess extends AddressState {
  final AddressResponseEntity addresses;

  GetAddressSuccess(this.addresses);
}

class GetAddressFailure extends AddressState {
  final String error;

  GetAddressFailure(this.error);
}
