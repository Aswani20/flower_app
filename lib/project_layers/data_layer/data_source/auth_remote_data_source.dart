import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/forget_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword({
    required String email,
    String? networkError,
    String? serverError,
  });

  Future<Either<Failures,VerifyResetCodeResponseEntity>> verifyResetCode({
    required String resetCode,
    String? networkError,
    String? serverError,
  });

  Future<Either<Failures,ResetPasswordResponseEntity>> resetPassword({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  });
}
