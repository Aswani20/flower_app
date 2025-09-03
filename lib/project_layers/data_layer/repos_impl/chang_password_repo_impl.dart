import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/change_password_request_body.dart';
import 'package:flower_app/project_layers/data_layer/data_source/change_password_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/change_password_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/chang_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangPasswordRepo)
class ChangPasswordRepoImpl implements ChangPasswordRepo {
  ChangePasswordRemoteDataSource
  changePasswordRemoteDataSource;

  ChangPasswordRepoImpl(
    this.changePasswordRemoteDataSource,
  );
  @override
  Future<ApiResult<ChangePasswordEntity>> changPassword(
    ChangePasswordRequestBody body,
  ) async {
    return await changePasswordRemoteDataSource
        .changPassword(body);
  }
}
