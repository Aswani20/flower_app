import 'package:flower_app/project_layers/domain_layer/entities/forget_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase{
  AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);

  Future<ForgetPasswordResponseEntity> invoke({required String email}) async{
    var forgetPasswordData = await authRepo.forgetPassword(email: email);
    return forgetPasswordData;
  }
}
