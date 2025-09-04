import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/UpdateProfileResponseEntity.dart';
import 'package:injectable/injectable.dart';
import '../entities/request/UpdateProfileRequestEntity.dart';
import '../repos/profile_repo.dart';

@injectable
class UpdateUserProfileUseCase {
  ProfileRepo profileRepo;
  UpdateUserProfileUseCase(this.profileRepo);

  Future<ApiResult<UpdateProfileResponseEntity>> invoke(
    UpdateProfileRequestEntity updateProfileRequestEntity,
  ) async {
    return await profileRepo.updateUserProfile(
      updateProfileRequestEntity,
    );
  }
}
