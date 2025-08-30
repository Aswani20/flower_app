import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/products_response.dart';
import 'package:flower_app/project_layers/data_layer/data_source/product_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl
    implements ProductRemoteDataSource {
  ApiClient apiClient;
  ProductRemoteDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<List<ProductEntity>>> getProducts(
    String? categoryId,
  ) async {
    try {
      ProductsResponse productsResponse = await apiClient
          .getProductsById(categoryId);
      return ApiSuccessResult(
        productsResponse.products!
            .map((e) => e.toProductEntity())
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<List<ProductEntity>>(
            message.toString(),
          );
        }
        return ApiErrorResult<List<ProductEntity>>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<List<ProductEntity>>(
        e.toString(),
      );
    }
  }
}
