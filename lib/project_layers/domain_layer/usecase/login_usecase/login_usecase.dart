import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/api_layer/requests/login_request/login_request.dart';
import 'package:flower_app/project_layers/api_layer/responses/login_response/login_response.dart';
import 'package:flower_app/project_layers/domain_layer/repos/login_repo/login_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';

@injectable
class LoginUseCase {
  LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<Failures, LoginResponse>> call({
    required LoginRequest response,
  }) async {
    return await loginRepository.login(request: response);
  }
}
