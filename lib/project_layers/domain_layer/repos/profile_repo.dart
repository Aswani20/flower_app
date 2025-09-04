import 'dart:io';

import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/UpdateProfileResponseEntity.dart';
import '../entities/request/UpdateProfileRequestEntity.dart';
import '../entities/update_photo_response_entity.dart';

abstract class ProfileRepo {
  Future<ApiResult<UpdateProfileResponseEntity>>
  updateUserProfile(
    UpdateProfileRequestEntity updateProfileRequestEntity,
  );

  Future<ApiResult<UpdatePhotoResponseEntity>>
  updateUserPhoto(File photo);
}
