import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);

  Future<Either<Failures, ResetPasswordResponseEntity>> invoke({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  }) async {
    var resetPasswordData = await authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
      networkError: networkError,
      serverError: serverError,
    );
    return resetPasswordData;
  }
}
