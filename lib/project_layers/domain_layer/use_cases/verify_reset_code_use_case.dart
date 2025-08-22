import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class VerifyResetCodeUseCase{
  AuthRepo authRepo;
  VerifyResetCodeUseCase(this.authRepo);

  Future<VerifyResetCodeResponseEntity> invoke({required String resetCode}) async{
    var verifyResetCodeData = await authRepo.verifyResetCode(resetCode: resetCode);
    return verifyResetCodeData;
  }

}