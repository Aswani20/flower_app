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
