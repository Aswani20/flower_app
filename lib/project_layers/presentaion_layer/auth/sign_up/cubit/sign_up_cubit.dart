import 'package:bloc/bloc.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/sign_up_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUseCase)
    : super(SignUpInitial());
  final SignUpUseCase signUpUseCase;
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  TextEditingController confirmPasswordController =
      TextEditingController();
  TextEditingController firstNameController =
      TextEditingController();
  TextEditingController lastNameController =
      TextEditingController();
  TextEditingController phoneNumberController =
      TextEditingController();
  GlobalKey<FormState> signUpFormKey =
      GlobalKey<FormState>();

  String selectedGender = '';
  SignUpEntity user = SignUpEntity();
  void selectGender(String gender) {
    selectedGender = gender;
    emit(SignupGenderSelected(selectedGender));
  }

  void signUp() async {
    emit(SignupLoading());
    var result = await signUpUseCase.call(
      SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneNumberController.text,
        gender: selectedGender,
      ),
    );

    switch (result) {
      case ApiSuccessResult<SignUpEntity>():
        emit(SignupSuccess(result.data));

        break;
      case ApiErrorResult<SignUpEntity>():
        emit(SignupError(result.errorMessage));
        break;
    }
  }
}
