import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/response/get_logged_user_data_response_dto.dart';
import 'package:flower_app/project_layers/data_layer/data_source/get_logget_user_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/get_logged_user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetLoggetUserDataSource)
class GetLoggedUserDataSourceImpl
    implements GetLoggetUserDataSource {
  ApiClient apiClient;

  GetLoggedUserDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<GetLoggedUserEntity>>
  getLoggetUserData() async {
    try {
      GetLoggedUserDataResponseDto
      getLoggedUserDataResponse = await apiClient
          .getLoggedUserData();
      return ApiSuccessResult(
        getLoggedUserDataResponse.user!
            .toGetLoggedUserEntity(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<GetLoggedUserEntity>(
            message.toString(),
          );
        }
        return ApiErrorResult<GetLoggedUserEntity>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<GetLoggedUserEntity>(
        e.toString(),
      );
    }
  }
}
