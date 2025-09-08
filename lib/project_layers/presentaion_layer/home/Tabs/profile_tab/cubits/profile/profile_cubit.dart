import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/get_logged_user_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/update_photo_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/change_password_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/get_logged_user_data_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/update_user_profile_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

import '../../../../../../domain_layer/entities/UpdateProfileResponseEntity.dart';
import '../../../../../../domain_layer/entities/request/UpdateProfileRequestEntity.dart';
import '../../../../../../domain_layer/use_cases/update_user_photo_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.getLoggedUserDataUseCase,
    this.changePasswordUseCase,
    this.updateUserProfileUseCase,
    this.updateUserPhotoUseCase,
  ) : super(ProfileInitial());

  // handle data
  GetLoggedUserDataUseCase getLoggedUserDataUseCase;
  UpdateUserProfileUseCase updateUserProfileUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  UpdateUserPhotoUseCase updateUserPhotoUseCase;

  // edit profile data
  TextEditingController firstNameController =
      TextEditingController();
  TextEditingController lastNameController =
      TextEditingController();
  TextEditingController emailController =
      TextEditingController();
  TextEditingController phoneController =
      TextEditingController();
  File? selectedImageFile;
  String photo = '';
  final ImagePicker _picker = ImagePicker();

  // Initialize cubit with user data when coming from arguments
  void initializeWithUser(GetLoggedUserEntity? user) {
    if (user != null) {
      firstNameController.text = user.firstName ?? '';
      lastNameController.text = user.lastName ?? '';
      emailController.text = user.email ?? '';
      phoneController.text = user.phone ?? '';
      photo = user.photo ?? '';
      emit(GetLoggedUserDataSuccess(user: user));
    }
  }

  // Change user photo using image picker and convert to PNG
  Future<void> changeUserPhoto() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        // Read the selected image bytes
        final Uint8List imageBytes = await pickedFile
            .readAsBytes();

        // Decode the image
        img.Image? originalImage = img.decodeImage(
          imageBytes,
        );

        if (originalImage != null) {
          // Convert to PNG format
          final Uint8List pngBytes = Uint8List.fromList(
            img.encodePng(originalImage),
          );

          // Create a temporary PNG file
          final Directory tempDir = Directory.systemTemp;
          final String fileName = 'default-profile.png';
          final File pngFile = File(
            '${tempDir.path}/$fileName',
          );

          // Write PNG bytes to file
          await pngFile.writeAsBytes(pngBytes);

          // Store both the file and path for different uses
          selectedImageFile = pngFile;

          emit(PhotoChangedLoadingState());

          final result = await updateUserPhotoUseCase
              .invoke(pngFile);

          switch (result) {
            case ApiSuccessResult<
              UpdatePhotoResponseEntity
            >():
              emit(PhotoChangedSuccess());
              break;

            case ApiErrorResult<
              UpdatePhotoResponseEntity
            >():
              emit(
                PhotoChangedError(
                  message: result.errorMessage,
                ),
              );
              break;
          }
        } else {
          emit(
            PhotoChangedError(
              message: 'Failed to decode image',
            ),
          );
        }
      }
    } catch (e) {
      emit(
        PhotoChangedError(
          message:
              'Failed to pick image: ${e.toString()}',
        ),
      );
    }
  }

  // Update user profile data
  Future<void> updateUserProfile() async {
    emit(UpdateUserProfileLoading());
    try {
      // Create updated user entity with current form data
      final result = await updateUserProfileUseCase
          .invoke(
            UpdateProfileRequestEntity(
              email: emailController.text.trim(),
              firstName: firstNameController.text.trim(),
              lastName: lastNameController.text.trim(),
              phone: phoneController.text.trim(),
            ),
          );

      switch (result) {
        case ApiSuccessResult<
          UpdateProfileResponseEntity
        >():
          emit(
            UpdateUserProfileSuccess(
              updateProfileResponseEntity: result.data,
            ),
          );
          break;

        case ApiErrorResult<
          UpdateProfileResponseEntity
        >():
          emit(
            UpdateUserProfileError(
              message: result.errorMessage,
            ),
          );
          break;
      }
    } catch (e) {
      emit(
        UpdateUserProfileError(
          message:
              'Failed to update profile: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> getLoggedUserData() async {
    emit(GetLoggedUserDataLoading());
    final result = await getLoggedUserDataUseCase.call();
    switch (result) {
      case ApiSuccessResult<GetLoggedUserEntity>():
        emit(GetLoggedUserDataSuccess(user: result.data));
        firstNameController.text =
            result.data.firstName ?? '';
        lastNameController.text =
            result.data.lastName ?? '';
        emailController.text = result.data.email ?? '';
        phoneController.text = result.data.phone ?? '';
        photo = result.data.photo ?? '';
        break;

      case ApiErrorResult<GetLoggedUserEntity>():
        emit(
          GetLoggedUserDataError(
            message: result.errorMessage,
          ),
        );
        break;
    }
  }
}
