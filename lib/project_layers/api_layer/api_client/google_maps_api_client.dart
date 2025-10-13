import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/response/directions_response_dto.dart';

part 'google_maps_api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://maps.googleapis.com/maps/api/')
abstract class GoogleMapsApiClient {
  @factoryMethod
  factory GoogleMapsApiClient(Dio dio) =
      _GoogleMapsApiClient;

  /// Get directions between two points
  ///
  /// [origin] - Starting point as "latitude,longitude"
  /// [destination] - Ending point as "latitude,longitude"
  /// [mode] - Travel mode: driving, walking, bicycling, transit
  /// [key] - Google Maps API key
  @GET('directions/json')
  Future<DirectionsResponseDto> getDirections({
    @Query('origin') required String origin,
    @Query('destination') required String destination,
    @Query('mode') String mode = 'driving',
    @Query('key') required String key,
  });
}
