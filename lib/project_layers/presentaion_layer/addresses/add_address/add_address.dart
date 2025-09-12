import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/dialog/dialog.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_validator.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/add_address/cubit/add_address_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AddAddressCubit>()..askForLocation(),
      child: const _AddAddressBody(),
    );
  }
}

class _AddAddressBody extends StatelessWidget {
  const _AddAddressBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAddressCubit, AddressState>(
      listener: (context, state) {
        if (state is AddAddressSuccess) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content:
                context.l10n.address_added_successfully,
            posActions: context.l10n.ok,
            posFunction: (p0) {
              Navigator.of(context).pop();
            },
          );
        } else if (state is AddAddressFailure) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.error,
          );
        } else if (state is AddAddressLoading) {
          DialogUtils.showLoading(
            context: context,
            loadingMessage: context.l10n.loading,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.h,
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(context.l10n.address),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: context
                    .read<AddAddressCubit>()
                    .formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  spacing: 15.h,
                  children: [
                    SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child:
                          context
                                  .read<AddAddressCubit>()
                                  .currentPosition ==
                              null
                          ? InkWell(
                              onTap: () {
                                context
                                    .read<
                                      AddAddressCubit
                                    >()
                                    .loadLocationData();
                              },
                              child: Image.asset(
                                Assets.images.map.path,
                                fit: BoxFit.cover,
                              ),
                            )
                          : _googleMap(context),
                    ),
                    TextFormField(
                      style: _formStyle(context),
                      controller: context
                          .read<AddAddressCubit>()
                          .addressController,
                      decoration: _inputDecoration(
                        context,
                        labelText: context.l10n.address,
                        hintText: context
                            .l10n
                            .enter_your_address,
                      ),
                      validator: (value) {
                        return AppValidators.emptyField(
                          value,
                          context.l10n.enter_your_address,
                          context,
                        );
                      },
                    ),

                    TextFormField(
                      style: _formStyle(context),
                      controller: context
                          .read<AddAddressCubit>()
                          .phoneController,
                      decoration: _inputDecoration(
                        context,
                        labelText:
                            context.l10n.phoneNumber,
                        hintText: context
                            .l10n
                            .enter_the_phone_number,
                      ),
                      validator: (value) {
                        return AppValidators.phoneNumberValidator(
                          value,
                          context,
                        );
                      },
                    ),

                    TextFormField(
                      style: _formStyle(context),
                      controller: context
                          .read<AddAddressCubit>()
                          .recipientController,
                      decoration: _inputDecoration(
                        context,
                        labelText:
                            context.l10n.receipient_name,
                        hintText: context
                            .l10n
                            .enter_the_recipient_name,
                      ),

                      validator: (value) {
                        return AppValidators.emptyField(
                          value,
                          context
                              .l10n
                              .enter_the_recipient_name,
                          context,
                        );
                      },
                    ),
                    Row(
                      spacing: 15.w,
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            style: _formStyle(context),
                            initialValue: context
                                .read<AddAddressCubit>()
                                .selectedCity,
                            onChanged: (city) {
                              context
                                      .read<
                                        AddAddressCubit
                                      >()
                                      .selectedCity =
                                  city;
                              context
                                  .read<AddAddressCubit>()
                                  .changeSelectedCity(
                                    city,
                                  );
                            },
                            validator: (value) {
                              return AppValidators.emptyField(
                                value?.governorateNameEn,
                                "${context.l10n.please_choose} ${context.l10n.city}",
                                context,
                              );
                            },
                            items: context
                                .read<AddAddressCubit>()
                                .cityList
                                .map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.governorateNameEn,
                                      maxLines: 1,
                                      overflow:
                                          TextOverflow
                                              .ellipsis,
                                      style: context
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors
                                                .black[600],
                                          ),
                                    ),
                                  );
                                })
                                .toList(),
                            decoration: _inputDecoration(
                              context,
                              labelText:
                                  context.l10n.city,
                              hintText: context.l10n.city,
                            ),
                          ),
                        ),

                        Expanded(
                          child: DropdownButtonFormField(
                            style: _formStyle(context),
                            initialValue: context
                                .read<AddAddressCubit>()
                                .selectedArea,
                            onChanged: (area) {
                              context
                                      .read<
                                        AddAddressCubit
                                      >()
                                      .selectedArea =
                                  area;
                            },
                            validator: (value) {
                              return AppValidators.emptyField(
                                value?.cityNameEn,
                                "${context.l10n.please_choose} ${context.l10n.area}",
                                context,
                              );
                            },

                            items: context
                                .read<AddAddressCubit>()
                                .areaList
                                .map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.cityNameEn.length >
                                              15
                                          ? e.cityNameEn
                                                .substring(
                                                  0,
                                                  15,
                                                )
                                          : e.cityNameEn,
                                      maxLines: 1,
                                      overflow:
                                          TextOverflow
                                              .ellipsis,
                                      style: context
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors
                                                .black[600],
                                          ),
                                    ),
                                  );
                                })
                                .toList(),
                            decoration: _inputDecoration(
                              context,
                              labelText:
                                  context.l10n.area,
                              hintText: context.l10n.area,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AddAddressCubit>()
                            .validateForm();
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.black[200],
                      ),
                      child: Text(
                        context.l10n.save_address,
                        style: context.textTheme.bodySmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  GoogleMap _googleMap(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          context
              .read<AddAddressCubit>()
              .currentPosition!
              .latitude,
          context
              .read<AddAddressCubit>()
              .currentPosition!
              .longitude,
        ),
        zoom: 17,
      ),
      onMapCreated: (controller) {
        context.read<AddAddressCubit>().controller =
            controller;
      },
      onTap: (argument) {
        context
            .read<AddAddressCubit>()
            .changeCameraPosition(argument);
      },
      markers: {
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(
            context
                .read<AddAddressCubit>()
                .currentPosition!
                .latitude,
            context
                .read<AddAddressCubit>()
                .currentPosition!
                .longitude,
          ),
        ),
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.terrain,
    );
  }

  InputDecoration? _inputDecoration(
    BuildContext context, {
    required String hintText,
    required String labelText,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: context.textTheme.bodySmall?.copyWith(
        color: Colors.grey,
      ),
      labelText: labelText,
      labelStyle: context.textTheme.bodySmall,
    );
  }

  TextStyle? _formStyle(BuildContext context) {
    return context.textTheme.bodySmall?.copyWith(
      color: AppColors.black[600],
    );
  }
}
