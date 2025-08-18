import 'package:dio/dio.dart';
import 'package:flower_app/core/utils/app_constants.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/api_layer/models/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@singleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(AppConstants.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequest);
}
