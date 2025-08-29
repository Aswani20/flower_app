import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/data_layer/model/best_seller_response_dto.dart';
import 'package:flower_app/project_layers/data_layer/model/category_response_dto.dart';
import 'package:flower_app/project_layers/data_layer/model/occasion_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://flower.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;


  @GET("/v1/categories")
  Future<HttpResponse<CategoryResponseDto>> getCategories();

  @GET("/v1/best-seller")
  Future<HttpResponse<BestSellerResponseDto>> getBestSellers();


  @GET("/v1/occasions")
  Future<HttpResponse<OccasionResponseDto>> getOccasions();

}
