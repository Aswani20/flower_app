import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/request/update_profile_request_dto.dart';
import 'package:flower_app/project_layers/domain_layer/entities/update_photo_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../data_layer/data_source/profile_repo_data_source.dart';
import '../../domain_layer/entities/UpdateProfileResponseEntity.dart';
import '../../domain_layer/entities/request/UpdateProfileRequestEntity.dart';
import '../models/response/update_photo_response_dto.dart';
import '../models/response/update_profile_response_dto.dart';

@Injectable(as: ProfileRepoDataSource)
class ProfileRepoDataSourceImpl
    implements ProfileRepoDataSource {
  ApiClient apiClient;

  ProfileRepoDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<UpdateProfileResponseEntity>>
  updateUserProfile(
    UpdateProfileRequestEntity updateProfileRequestEntity,
  ) async {
    try {
      UpdateProfileResponseDto updateProfileResponseDto =
          await apiClient.editProfile(
            UpdateProfileRequestDto.fromEntity(
              updateProfileRequestEntity,
            ),
          );
      return ApiSuccessResult(
        updateProfileResponseDto.toEntity(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<
            UpdateProfileResponseEntity
          >(message.toString());
        }
        return ApiErrorResult<
          UpdateProfileResponseEntity
        >(e.message ?? e.toString());
      }
      return ApiErrorResult<UpdateProfileResponseEntity>(
        e.toString(),
      );
    }
  }

  @override
  Future<ApiResult<UpdatePhotoResponseEntity>>
  updateUserPhoto(File photo) async {
    try {
      UpdatePhotoResponseDto updatePhotoResponseDto =
          await apiClient.changePhoto(photo);
      return ApiSuccessResult(
        updatePhotoResponseDto.toEntity(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null &&
            responseData is Map<String, dynamic>) {
          final message =
              responseData["message"] ?? "Unknown error";
          return ApiErrorResult<
            UpdatePhotoResponseEntity
          >(message.toString());
        }
        return ApiErrorResult<UpdatePhotoResponseEntity>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<UpdatePhotoResponseEntity>(
        e.toString(),
      );
    }
  }
}
