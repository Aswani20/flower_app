import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/api_layer/models/request/login_request.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../../api_layer/models/response/login_response.dart';
import '../../domain_layer/repos/login_repo.dart';
import '../data_source/login_data_source.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl(this.loginDataSource);

  @override
  Future<Either<Failures, LoginResponse>> login({
    required LoginRequest request,
  }) async {
    try {
      final response = await loginDataSource.login(request: request);
      return Right(response);
    } on Failures catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UserError(errorMessage: 'Unexpected error: $e'));
    }
  }
}
