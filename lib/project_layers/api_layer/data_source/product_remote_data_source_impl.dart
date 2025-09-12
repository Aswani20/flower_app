import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/products_response.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_filter.dart';
import 'package:injectable/injectable.dart';

import '../../data_layer/data_source/product_remote_data_source.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl
    implements ProductRemoteDataSource {
  ApiClient apiClient;
  ProductRemoteDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<List<ProductEntity>>> getProducts(
    ProductFilter filter,
  ) async {
    try {
      final Map<String, dynamic> queryParameters = {};

      // 2. تطبيق الشروط وإضافة القيم غير الفارغة إلى الخريطة
      if (filter.occasionId != null) {
        queryParameters['occasion'] = filter.occasionId;
      }

      if (filter.categoryId != null) {
        queryParameters['category'] = filter.categoryId;
      }

      if (filter.filter != null) {
        queryParameters['sort'] = filter.filter;
      }
      ProductsResponse productsResponse =
          await apiClient.getProductsByIdF(
                queryParameters,
              )
              as ProductsResponse;
      if (filter.occasionId != null ||
          filter.categoryId != null ||
          filter.filter != null) {
        return ApiSuccessResult(
          productsResponse.products!
              .map((e) => e.toProductEntity())
              .toList(),
        );
      } else {
        throw ArgumentError(
          'occasionId or categoryId must be provided.',
        );
      }
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
