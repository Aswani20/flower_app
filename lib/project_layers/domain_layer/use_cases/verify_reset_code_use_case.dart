import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class VerifyResetCodeUseCase{
  AuthRepo authRepo;
  VerifyResetCodeUseCase(this.authRepo);

  Future<Either<Failures,VerifyResetCodeResponseEntity>> invoke({required String resetCode,String? networkError,
    String? serverError,}) async{
    var verifyResetCodeData = await authRepo.verifyResetCode(resetCode: resetCode,networkError: networkError,serverError: serverError);
    return verifyResetCodeData;

  }

}