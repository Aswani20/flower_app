import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<ApiResult<SignUpEntity>> call(SignUpRequestBody signUpRequest) async {
    final result = await signUpRepo.signUp(signUpRequest);
    return result;
  }
}
