import 'dart:io';

import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/UpdateProfileResponseEntity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/update_photo_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain_layer/entities/request/UpdateProfileRequestEntity.dart';
import '../../domain_layer/repos/profile_repo.dart';
import '../data_source/profile_repo_data_source.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoDataSource profileRepoDataSource;

  ProfileRepoImpl(this.profileRepoDataSource);

  @override
  Future<ApiResult<UpdateProfileResponseEntity>>
  updateUserProfile(
    UpdateProfileRequestEntity updateProfileRequestEntity,
  ) async {
    return await profileRepoDataSource.updateUserProfile(
      updateProfileRequestEntity,
    );
  }

  @override
  Future<ApiResult<UpdatePhotoResponseEntity>>
  updateUserPhoto(File photo) async {
    return await profileRepoDataSource.updateUserPhoto(
      photo,
    );
  }
}
