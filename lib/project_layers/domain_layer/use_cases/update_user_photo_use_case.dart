import 'dart:io';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/update_photo_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../repos/profile_repo.dart';

@injectable
class UpdateUserPhotoUseCase {
  ProfileRepo profileRepo;
  UpdateUserPhotoUseCase(this.profileRepo);

  Future<ApiResult<UpdatePhotoResponseEntity>> invoke(
    File photo,
  ) async {
    return await profileRepo.updateUserPhoto(photo);
  }
}
