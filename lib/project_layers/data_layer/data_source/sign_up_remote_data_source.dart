import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';

abstract class SignUpRemoteDataSource {
  Future<ApiResult<SignUpEntity>> signUp(SignUpRequestBody signUpRequest);
}