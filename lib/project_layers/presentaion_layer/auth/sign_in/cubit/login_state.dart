part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponse response;

  LoginSuccessState(this.response);
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class LoginFormInteractionState extends LoginState {
  final bool isButtonEnabled;

  LoginFormInteractionState({required this.isButtonEnabled});
}

class GuestLoginSuccessState extends LoginState {}

class LoginRememberMeChanged extends LoginState {
  final bool isRememberMe;

  LoginRememberMeChanged(this.isRememberMe);
}
