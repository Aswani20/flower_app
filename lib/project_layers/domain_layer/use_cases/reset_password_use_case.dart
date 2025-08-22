import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase{
  AuthRepo authRepo;
  ResetPasswordUseCase(this.authRepo);

  Future<ResetPasswordResponseEntity> invoke({required String email, required String newPassword}) async{
    var resetPasswordData = await authRepo.resetPassword(email: email, newPassword: newPassword);
    return resetPasswordData;

  }
}