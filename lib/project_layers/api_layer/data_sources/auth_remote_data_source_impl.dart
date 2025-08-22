import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/model/requests/forget_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/model/requests/reset_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/model/requests/verify_reset_code_request_dto.dart';
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
  Future<ForgetPasswordResponseEntity> forgetPassword({required String email,}) async {
    try {
      var response = await _apiClient.forgetPassword(
        forgetPasswordRequestDto: ForgetPasswordRequestDto(email: email),
      );
      var statusCode = response.response.statusCode;
      var forgetPasswordData = response.data;
      if (statusCode! >= 200 && statusCode < 300) {
        return forgetPasswordData.toEntity();
      } else {
        throw Exception("Something went wrong");
      }
    } on DioException catch (e) {
      throw Exception(e.response!.data.toString());
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<VerifyResetCodeResponseEntity> verifyResetCode({required String resetCode,}) async {
    try {
      var response = await _apiClient.verifyResetCode(
        verifyResetCodeRequestDto: VerifyResetCodeRequestDto(
          resetCode: resetCode,
        ),
      );
      var statusCode = response.response.statusCode;
      var verifyResetCodeData = response.data;
      if (statusCode! >= 200 && statusCode < 300) {
        return verifyResetCodeData.toEntity();
      } else {
        throw Exception("Something went wrong");
      }
    } on DioException catch (e) {
      throw Exception(e.response!.data.toString());
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<ResetPasswordResponseEntity> resetPassword({required String email, required String newPassword}) async{
    try{
      var response =await _apiClient.resetPassword(resetPasswordRequestDto: ResetPasswordRequestDto(email: email,newPassword: newPassword));
      var statusCode = response.response.statusCode;
      var resetPasswordData = response.data;
      if (statusCode! >= 200 && statusCode < 300) {
        return resetPasswordData.toEntity();
      } else {
        throw Exception("Something went wrong");
      }
    }on DioException catch (e) {
      throw Exception(e.response!.data.toString());
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
