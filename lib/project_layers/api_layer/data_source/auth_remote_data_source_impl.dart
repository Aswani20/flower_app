import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/request/forget_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/request/reset_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/request/verify_reset_code_request_dto.dart';
import 'package:flower_app/project_layers/data_layer/data_source/auth_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/forget_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl
    implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>>
  forgetPassword({
    required String email,
    String? networkError,
    String? serverError,
  }) async {
    try {
      var response = await _apiClient.forgetPassword(
        forgetPasswordRequestDto:
            ForgetPasswordRequestDto(email: email),
      );
      var statusCode = response.response.statusCode;
      var forgetPasswordData = response.data;
      if (statusCode! >= 200 && statusCode < 300) {
        return right(forgetPasswordData.toEntity());
      } else {
        return left(
          ServerError(
            errorMessage:
                forgetPasswordData.message ??
                serverError!,
          ),
        );
      }
    } on DioException catch (e) {
      return left(
        ServerError(
          errorMessage:
              e.response?.data.toString() ??
              "Unknown Dio error",
        ),
      );
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<Either<Failures, VerifyResetCodeResponseEntity>>
  verifyResetCode({
    required String resetCode,
    String? networkError,
    String? serverError,
  }) async {
    try {
      var response = await _apiClient.verifyResetCode(
        verifyResetCodeRequestDto:
            VerifyResetCodeRequestDto(
              resetCode: resetCode,
            ),
      );
      var statusCode = response.response.statusCode;
      var verifyResetCodeData = response.data;
      if (statusCode! >= 200 && statusCode < 300) {
        return right(verifyResetCodeData.toEntity());
      } else {
        return left(
          ServerError(
            errorMessage: "verifyResetCodeData.message",
          ),
        );
      }
    } on DioException catch (e) {
      return left(
        ServerError(
          errorMessage:
              e.response?.data.toString() ??
              "Unknown Dio error",
        ),
      );
    } catch (e) {
      return left(
        ServerError(errorMessage: "Unexpected error: $e"),
      );
    }
  }

  @override
  Future<Either<Failures, ResetPasswordResponseEntity>>
  resetPassword({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  }) async {
    try {
      var response = await _apiClient.resetPassword(
        resetPasswordRequestDto: ResetPasswordRequestDto(
          email: email,
          newPassword: newPassword,
        ),
      );
      var statusCode = response.response.statusCode;
      var resetPasswordData = response.data;
      if (statusCode! >= 200 && statusCode < 300) {
        return right(resetPasswordData.toEntity());
      } else {
        return left(
          ServerError(
            errorMessage:
                resetPasswordData.message ?? serverError!,
          ),
        );
      }
    } on DioException catch (e) {
      return left(
        ServerError(
          errorMessage:
              e.response?.data.toString() ??
              "Unknown Dio error",
        ),
      );
    } catch (e) {
      return left(
        ServerError(errorMessage: "Unexpected error: $e"),
      );
    }
  }
}
