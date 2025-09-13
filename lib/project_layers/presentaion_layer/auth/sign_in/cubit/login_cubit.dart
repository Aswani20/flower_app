import 'package:bloc/bloc.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/project_layers/api_layer/models/request/login_request.dart';
import 'package:flower_app/project_layers/api_layer/models/response/login_response.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/login_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

final storage = FlutterSecureStorage();

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase})
    : super(LoginInitial());

  TextEditingController emailController =
      TextEditingController(text: "adekheel@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Elevate@123");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isEnable = false;
  bool isObscureText = true;

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      try {
        var response = await loginUseCase.call(
          response: LoginRequest(
            email: emailController.text,
            password: passwordController.text,
          ),
        );

        response.fold(
          (error) =>
              emit(LoginErrorState(error.errorMessage)),
          (loginResponse) async {
            await storage.write(
              key: 'token',
              value: loginResponse.token,
            );
            if (isRememberMe) {
              await storage.write(
                key: 'email',
                value: emailController.text,
              );
              await storage.write(
                key: 'password',
                value: passwordController.text,
              );
            } else {
              await storage.delete(key: 'email');
              await storage.delete(key: 'password');
            }
            emit(LoginSuccessState(loginResponse));
          },
        );
      } catch (e) {
        emit(LoginErrorState("Login failed: $e"));
      }
    }
  }

  void loginAsGuest(BuildContext context) async {
    emit(LoginLoading());
    try {
      await storage.write(key: 'isGuest', value: 'true');
      emit(GuestLoginSuccessState());
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.homeScreen,
      );
    } catch (e) {
      emit(
        LoginErrorState("Failed to login as guest: $e"),
      );
    }
  }

  bool isRememberMe = false;

  void toggleRememberMe(bool value) {
    isRememberMe = value;
    emit(LoginRememberMeChanged(isRememberMe));
  }

  void checkFormValidity() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      isEnable = true;
      emit(
        LoginFormInteractionState(
          isButtonEnabled: isEnable,
        ),
      );
    } else {
      isEnable = false;
      emit(
        LoginFormInteractionState(
          isButtonEnabled: isEnable,
        ),
      );
    }
  }
}
