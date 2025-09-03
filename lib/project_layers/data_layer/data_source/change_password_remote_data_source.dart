import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/change_password_request_body.dart';
import 'package:flower_app/project_layers/domain_layer/entities/change_password_entity.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<ApiResult<ChangePasswordEntity>> changPassword(
    ChangePasswordRequestBody body,
  );
}
