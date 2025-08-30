import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/data_layer/data_source/sign_up_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepo)
class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteDataSource signUpRemoteDataSource;

  SignUpRepoImpl(this.signUpRemoteDataSource);
  @override
  Future<ApiResult<SignUpEntity>> signUp(
      SignUpRequestBody signUpRequest,
      ) async {
    return await signUpRemoteDataSource.signUp(signUpRequest);
  }
}