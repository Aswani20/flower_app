import 'package:bloc/bloc.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';
import 'package:flower_app/project_layers/domain_layer/usecase/sign_up_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() async {
    final result = await signUpUseCase.call(
      SignUpRequestBody(
        gender: 'male',
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        rePassword: passwordConfirmationController.text,
      ),
    );
    switch (result) {
      case ApiSuccessResult<SignUpEntity>():
        emit(SignUpSuccess(signUpEntity: result.data));
        break;
      case ApiErrorResult():
        emit(SignUpError(message: result.errorMessage));
        debugPrint(result.errorMessage);
        break;
    }
  }
}
