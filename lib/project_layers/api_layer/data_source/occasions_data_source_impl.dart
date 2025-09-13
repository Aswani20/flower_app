import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/data_layer/model/occasions_response.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';
import '../../data_layer/data_source/occasions_data_source.dart';

@Injectable(as: OccasionsDataSource)
class OccasionsDataSourceImpl
    implements OccasionsDataSource {
  ApiClient apiClient;

  OccasionsDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<OccasionEntity>>>
  getOccasions() async {
    try {
      OccasionsResponse occasionsResponse =
          await apiClient.getOccasions();
      return ApiSuccessResult(
        occasionsResponse.occasions!
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
          return ApiErrorResult<List<OccasionEntity>>(
            message.toString(),
          );
        }
        return ApiErrorResult<List<OccasionEntity>>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<List<OccasionEntity>>(
        e.toString(),
      );
    }
  }
}
