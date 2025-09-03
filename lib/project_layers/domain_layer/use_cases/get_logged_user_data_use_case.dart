import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/get_logged_user_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/get_logged_user_data_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserDataUseCase {
  GetLoggedUserDataRepo getLoggedUserDataRepo;
  GetLoggedUserDataUseCase(this.getLoggedUserDataRepo);

  Future<ApiResult<GetLoggedUserEntity>> call() async {
    final result = await getLoggedUserDataRepo
        .getLoggedUserData();
    return result;
  }
}
