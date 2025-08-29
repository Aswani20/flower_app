import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/data_layer/data_source/auth_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/forget_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword({
    required String email,
    String? networkError,
    String? serverError,
  }) async {
    var forgetPasswordData = await _authRemoteDataSource.forgetPassword(
      email: email,
      networkError: networkError,
      serverError: serverError,
    );
    return forgetPasswordData.fold(
        (response) => Left(response),
        (error) => Right(error)
    );
  }

  @override
  Future<Either<Failures,VerifyResetCodeResponseEntity>> verifyResetCode({
    required String resetCode,
    String? networkError,
    String? serverError,
  }) async {
    var verifyResetCodeData = await _authRemoteDataSource.verifyResetCode(
      resetCode: resetCode,
      networkError: networkError,
      serverError: serverError
    );
    return verifyResetCodeData.fold(
          (response) {
        return Left(response);
      },
          (error) {
        return Right(error);
      },
    );
  }

  @override
  Future<Either<Failures,ResetPasswordResponseEntity>> resetPassword({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  }) async {
    var resetPasswordData = await _authRemoteDataSource.resetPassword(
      email: email,
      newPassword: newPassword,
      networkError: networkError,
      serverError: serverError,
    );
    return resetPasswordData.fold(
          (response) {
        return Left(response);
      },
          (error) {
        return Right(error);
      },
    );
  }
}
