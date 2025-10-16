import 'package:flower_app/core/utils/widgets/delivery_contact_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/core/di/di.dart';
import '../cubit/map_view_model.dart';
import '../cubit/map_states.dart';

class TrackOrderMap extends StatelessWidget {
  const TrackOrderMap({super.key});

  @override
  Widget build(BuildContext context) {
    var order =
        ModalRoute.of(context)!.settings.arguments
            as String;
    return BlocProvider(
      create: (context) {
        return getIt<MapViewModel>()
          ..listenToOrderUpdates(order);
      },
      child: MapViewBody(order: order),
    );
  }
}

class MapViewBody extends StatelessWidget {
  const MapViewBody({required this.order, super.key});
  final String order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapViewModel, MapStates>(
        builder: (context, state) {
          if (state is MapLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.pink,
              ),
            );
          }

          if (state is MapErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.error,
                    style: AppStyles.regular14grey,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No Driver Assigned Yet',
                    style: AppStyles.medium18black,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<MapViewModel>()
                          .listenToOrderUpdates(order);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Handle map states
          if (state is MapLoadedState ||
              state is MapLocationUpdatedState) {
            // Get current map state
            final MapLoadedState mapState;
            if (state is MapLoadedState) {
              mapState = state;
            } else if (state is MapLocationUpdatedState) {
              if (state is! MapLoadedState) {
                return const Center(
                  child: Text('Waiting for map data...'),
                );
              }
              mapState = state as MapLoadedState;
            } else {
              return const Center(
                child: Text('Invalid map state'),
              );
            }

            return Stack(
              children: [
                GoogleMap(
                  onMapCreated:
                      (GoogleMapController controller) {
                        context
                            .read<MapViewModel>()
                            .onMapCreated(controller);
                      },
                  initialCameraPosition: CameraPosition(
                    target: mapState.currentLocation,
                    zoom: 14.0,
                  ),
                  markers: mapState.markers,
                  polylines: mapState.polylines,
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                ),

                // Bottom delivery info container
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.1,
                          ),
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DeliveryContactInfo(
                          deliveryPersonName:
                              mapState.deliveryPersonName,
                          estimatedArrival:
                              mapState.estimatedArrival,
                          showDetailsButton: true,
                          phoneNo: mapState.driverPhoneNo,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          // Only show "Initializing map..." for MapInitialState
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppColors.pink,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Initializing map...',
                    style: AppStyles.medium16black,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
