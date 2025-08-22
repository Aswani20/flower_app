import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/api_layer/model/requests/forget_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/model/requests/reset_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/model/requests/verify_reset_code_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/model/responses/forget_password_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/model/responses/reset_password_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/model/responses/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://flower.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('/v1/auth/forgotPassword')
  Future<HttpResponse<ForgetPasswordResponseDto>> forgetPassword({
    @Body() required ForgetPasswordRequestDto forgetPasswordRequestDto,
  });

  @POST('/v1/auth/verifyResetCode')
  Future<HttpResponse<VerifyResetCodeResponseDto>> verifyResetCode({
    @Body() required VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  });

  @PUT('/v1/auth/resetPassword')
  Future<HttpResponse<ResetPasswordResponseDto>> resetPassword({
    @Body() required ResetPasswordRequestDto resetPasswordRequestDto,
});
}
