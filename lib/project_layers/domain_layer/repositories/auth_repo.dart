import 'package:flower_app/project_layers/domain_layer/entities/forget_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';

abstract class AuthRepo{
  Future<ForgetPasswordResponseEntity> forgetPassword({required String email});

  Future<VerifyResetCodeResponseEntity> verifyResetCode({required String resetCode});

  Future<ResetPasswordResponseEntity> resetPassword({required String email, required String newPassword});
}