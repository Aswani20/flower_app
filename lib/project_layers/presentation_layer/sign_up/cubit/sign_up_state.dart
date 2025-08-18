part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUpEntity? signUpEntity;

  SignUpSuccess({this.signUpEntity});
}

final class SignUpError extends SignUpState {
  final String? message;
  SignUpError({this.message});
}
