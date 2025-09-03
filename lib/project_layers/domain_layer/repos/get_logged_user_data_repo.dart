import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/get_logged_user_entity.dart';

abstract class GetLoggedUserDataRepo {
  Future<ApiResult<GetLoggedUserEntity>>
  getLoggedUserData();
}
