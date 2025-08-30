import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/api_layer/responses/best_seller_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://flower.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/v1/best-seller")
  Future<HttpResponse<BestSellerResponse>> getBestSellersProduct();
}
