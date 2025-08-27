import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/categories_response.dart';
import 'package:flower_app/project_layers/data_layer/data_source/category_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl
    implements CategoryRemoteDataSource {
  ApiClient apiClient;

  CategoryRemoteDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<List<CategoryEntity>>>
  getCategories() async {
    try {
      CategoriesResponse categoriesResponse =
          await apiClient.getCategories();
      return ApiSuccessResult(
        categoriesResponse.categories!
            .map((e) => e.toCategoryEntity())
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<List<CategoryEntity>>(
            message.toString(),
          );
        }
        return ApiErrorResult<List<CategoryEntity>>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<List<CategoryEntity>>(
        e.toString(),
      );
    }
  }
}
