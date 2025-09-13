import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data_layer/data_source/product_data_source.dart';
import '../../data_layer/model/products_response.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  ApiClient apiClient;

  ProductDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<ProductEntity>>> getProducts(
    String? occasionId,
  ) async {
    try {
      ProductsResponse productsResponse = await apiClient
          .getProductsById(occasionId);
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
