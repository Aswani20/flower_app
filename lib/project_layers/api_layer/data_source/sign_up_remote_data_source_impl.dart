import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/api_layer/models/response/sign_up_response.dart';
import 'package:flower_app/project_layers/data_layer/data_source/sign_up_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/di/modules/shared_preferences_module.dart';
import '../../../core/errors/failures.dart';
import '../../../core/keys/shared_key.dart';

@Injectable(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl
    implements SignUpRemoteDataSource {
  final ApiClient apiClient;

  SignUpRemoteDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<SignUpEntity>> signUp(
    SignUpRequestBody signUpRequest,
  ) async {
    try {
      SignUpResponse signUpResponse = await apiClient
          .signUp(signUpRequest);
      if (signUpResponse.token != null) {
        await SharedPrefHelper().setString(
          key: SharedPrefKeys.tokenKey,
          stringValue: signUpResponse.token!,
        );
      }
      if (signUpResponse.token!.isEmpty) {
        throw ServerError(
          errorMessage: "Invalid credentials",
        );
      }

      return ApiSuccessResult(
        signUpResponse.user!.toSignUpEntity(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<SignUpEntity>(
            message.toString(),
          );
        }
        return ApiErrorResult<SignUpEntity>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<SignUpEntity>(e.toString());
    }
  }
}
