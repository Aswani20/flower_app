import 'dart:io';

import '../../../core/api_result/api_result.dart';
import '../../domain_layer/entities/UpdateProfileResponseEntity.dart';
import '../../domain_layer/entities/request/UpdateProfileRequestEntity.dart';
import '../../domain_layer/entities/update_photo_response_entity.dart';

abstract class ProfileRepoDataSource {
  Future<ApiResult<UpdateProfileResponseEntity>>
  updateUserProfile(
    UpdateProfileRequestEntity updateProfileRequestEntity,
  );

  Future<ApiResult<UpdatePhotoResponseEntity>>
  updateUserPhoto(File photo);
}
