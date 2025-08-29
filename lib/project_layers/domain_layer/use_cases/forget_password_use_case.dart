import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/forget_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepo authRepo;

  ForgetPasswordUseCase(this.authRepo);

  Future<Either<Failures, ForgetPasswordResponseEntity>> invoke({
    required String email,
    String? networkError,
    String? serverError,
  }) async {
    var forgetPasswordData = await authRepo.forgetPassword(
      email: email,
      networkError: networkError,
      serverError: serverError,
    );
    return forgetPasswordData;
  }
}
