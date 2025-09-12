import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/api_layer/models/request/login_request.dart';
import '../../../core/errors/failures.dart';
import '../../api_layer/models/response/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failures, LoginResponse>> login({
    required LoginRequest request,
  });
}
