part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignupLoading extends SignUpState {}

final class SignupSuccess extends SignUpState {
  final SignUpEntity response;

  SignupSuccess(this.response);
}

class SignupError extends SignUpState {
  final String message;

  SignupError(this.message);
}

class SignupGenderSelected extends SignUpState {
  final String gender;

  SignupGenderSelected(this.gender);
}