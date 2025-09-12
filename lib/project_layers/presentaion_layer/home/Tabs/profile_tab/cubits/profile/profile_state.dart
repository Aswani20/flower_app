part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetLoggedUserDataLoading
    extends ProfileState {}

final class GetLoggedUserDataError extends ProfileState {
  final String message;
  GetLoggedUserDataError({required this.message});
}

final class GetLoggedUserDataSuccess
    extends ProfileState {
  final GetLoggedUserEntity user;
  GetLoggedUserDataSuccess({required this.user});
}

// Photo change states
class PhotoChangedLoadingState extends ProfileState {
  PhotoChangedLoadingState();
}

final class PhotoChangedSuccess extends ProfileState {
  PhotoChangedSuccess();
}

final class PhotoChangedError extends ProfileState {
  final String message;
  PhotoChangedError({required this.message});
}

// Profile update states
final class UpdateUserProfileLoading
    extends ProfileState {}

final class UpdateUserProfileSuccess
    extends ProfileState {
  final UpdateProfileResponseEntity
  updateProfileResponseEntity;
  UpdateUserProfileSuccess({
    required this.updateProfileResponseEntity,
  });
}

final class UpdateUserProfileError extends ProfileState {
  final String message;
  UpdateUserProfileError({required this.message});
}
