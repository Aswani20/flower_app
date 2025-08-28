import 'package:dio/dio.dart';
import 'package:flower_app/core/resources/app_constants.dart';
import 'package:flower_app/project_layers/api_layer/models/categories_response.dart';
import 'package:flower_app/project_layers/api_layer/models/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(AppConstants.categories)
  Future<CategoriesResponse> getCategories();

  @GET(AppConstants.products)
  Future<ProductsResponse> getProductsById(
    @Query("category") String? categoryId,
  );
}
