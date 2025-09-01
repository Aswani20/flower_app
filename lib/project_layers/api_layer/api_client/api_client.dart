import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/data_layer/model/occasions_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../data_layer/model/products_response.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://flower.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/v1/occasions")
  Future<OccasionsResponse> getOccasions();

  @GET("/v1/products")
  Future<ProductsResponse> getProductsById(
    @Query("occasion") String? occasionId,
  );
}
