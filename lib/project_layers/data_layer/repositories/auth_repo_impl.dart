import 'package:flower_app/project_layers/data_layer/data_source/auth_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/forget_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/reset_password_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/verify_reset_code_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ForgetPasswordResponseEntity> forgetPassword({required String email}) async{
    var forgetPasswordData =await _authRemoteDataSource.forgetPassword(email: email);
    return forgetPasswordData;
  }

  @override
  Future<VerifyResetCodeResponseEntity> verifyResetCode({required String resetCode}) async{
    var verifyResetCodeData =await _authRemoteDataSource.verifyResetCode(resetCode: resetCode);
    return verifyResetCodeData;
  }

  @override
  Future<ResetPasswordResponseEntity> resetPassword({required String email, required String newPassword}) async{
    var resetPasswordData = await _authRemoteDataSource.resetPassword(email: email, newPassword: newPassword);
    return resetPasswordData;

  }
  
}