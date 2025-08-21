import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/api_layer/requests/login_request/login_request.dart';
import '../../../../core/errors/failures.dart';
import '../../../api_layer/responses/login_response/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failures, LoginResponse>> login({
    required LoginRequest request,
  });
}
