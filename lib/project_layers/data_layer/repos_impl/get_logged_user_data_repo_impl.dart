import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/get_logget_user_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/get_logged_user_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/get_logged_user_data_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetLoggedUserDataRepo)
class GetLoggedUserDataRepoImpl
    implements GetLoggedUserDataRepo {
  GetLoggetUserDataSource getLoggedUserDataSource;

  GetLoggedUserDataRepoImpl(this.getLoggedUserDataSource);
  @override
  Future<ApiResult<GetLoggedUserEntity>>
  getLoggedUserData() async {
    return await getLoggedUserDataSource
        .getLoggetUserData();
  }
}
