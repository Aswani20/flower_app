import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/core/di/modules/location_service.dart';
import 'package:flower_app/project_layers/api_layer/models/city_model.dart';
import 'package:flower_app/project_layers/api_layer/models/governorate_model.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/request/add_address_request_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/add_address_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressCubit extends Cubit<AddressState> {
  AddAddressCubit(this.addAddressUseCase)
    : super(AddressInitial());

  // save data
  // handle data
  AddAddressUseCase addAddressUseCase;

  List<Governorate> cityList = [];
  List<City> areaList = [];

  LatLng? currentPosition;

  // form data
  final formKey = GlobalKey<FormState>();
  TextEditingController addressController =
      TextEditingController();

  TextEditingController phoneController =
      TextEditingController();

  TextEditingController recipientController =
      TextEditingController();

  Governorate? selectedCity;
  City? selectedArea;

  GoogleMapController? controller;

  // handle logic
  void askForLocation() async {
    emit(LocationLoading());
    try {
      cityList = await LocationService.getGovernorates();
      selectedCity = cityList[0];

      areaList =
          await LocationService.getCitiesByGovernorate(
            selectedCity!.id,
          );
      emit(LocationLoaded(position: currentPosition));
    } catch (e) {
      emit(LocationFailure(e.toString()));
    }
  }

  void loadLocationData() async {
    final location =
        await LocationService.getCurrentLocation();
    if (location != null) {
      currentPosition = location;

      final String addressDetails =
          await LocationService.getLocationDetails(
            currentPosition!,
          );

      refreshAddressData(addressDetails);
      emit(LocationLoaded(position: currentPosition));
    } else {
      emit(
        LocationFailure("Unable to retrieve location"),
      );
    }
  }

  void changeSelectedCity(Governorate? city) async {
    selectedCity = city;
    areaList =
        await LocationService.getCitiesByGovernorate(
          selectedCity!.id,
        );
    selectedArea = areaList[0];
    emit(LocationLoaded());
  }

  void refreshAddressData(String addressDetails) {
    List<String> address = addressDetails
        .split(',')
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .toList();

    // Ensure we have enough address parts
    if (address.isNotEmpty) {
      addressController.text = address[0];
    }

    if (address.length > 1) {
      String area = address[1].length > 15
          ? address[1].substring(0, 15)
          : address[1];
      areaList = [
        City(
          id: "id",
          governorateId: "governorateId",
          cityNameAr: area,
          cityNameEn: area,
        ),
      ];
      selectedArea = areaList[0];
    }

    if (address.length > 2) {
      String city = address[2].length > 15
          ? address[2].substring(0, 15)
          : address[2];
      cityList = [
        Governorate(
          id: "id",
          governorateNameAr: city,
          governorateNameEn: city,
        ),
      ];
      selectedCity = cityList[0];
    }
  }

  void changeCameraPosition(LatLng position) async {
    controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 17),
      ),
    );
    final String addressDetails =
        await LocationService.getLocationDetails(
          currentPosition!,
        );
    currentPosition = position;

    refreshAddressData(addressDetails);
    emit(LocationLoaded(position: currentPosition));
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      addAddress();
    }
  }

  // add address
  Future<void> addAddress() async {
    emit(AddAddressLoading());
    try {
      // Create updated user entity with current form data
      final result = await addAddressUseCase.invoke(
        AddAddressRequestEntity(
          street: addressController.text.trim(),
          phone: phoneController.text.trim(),
          city: selectedCity?.governorateNameEn,
          lat:
              currentPosition?.latitude.toString() ?? "z",
          long:
              currentPosition?.longitude.toString() ??
              "z",
          username: recipientController.text.trim(),
        ),
      );

      switch (result) {
        case ApiSuccessResult<AddressResponseEntity>():
          emit(AddAddressSuccess());
          break;

        case ApiErrorResult<AddressResponseEntity>():
          emit(AddAddressFailure(result.errorMessage));
          break;
      }
    } catch (e) {
      emit(
        AddAddressFailure(
          'Failed to add address: ${e.toString()}',
        ),
      );
    }
  }
}
