import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/change_password_request_body.dart';
import 'package:flower_app/project_layers/domain_layer/entities/change_password_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/chang_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  ChangPasswordRepo changPasswordRepo;

  ChangePasswordUseCase(this.changPasswordRepo);

  Future<ApiResult<ChangePasswordEntity>> call(
    ChangePasswordRequestBody body,
  ) async {
    final result = await changPasswordRepo.changPassword(
      body,
    );
    return result;
  }
}
