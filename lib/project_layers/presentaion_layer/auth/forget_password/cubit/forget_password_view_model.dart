import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/forget_password_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/reset_password_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/verify_reset_code_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPassStates> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyResetCodeUseCase verifyResetCodeUseCase;
  ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordViewModel({
    required this.forgetPasswordUseCase,
    required this.verifyResetCodeUseCase,
    required this.resetPasswordUseCase,
  }) : super(ForgetPassInitState());

  // forgetPasswordScreen attributes
  PageController pageController = PageController(initialPage: 0);

  // forgetPassword body attributes and behaviors
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> forgetPassFormKey = GlobalKey<FormState>();
  bool forgetPassBtnEnabled = false;

  void validateForgetPassBtn() {
    if (emailController.text.isNotEmpty && emailController.text != '') {
      forgetPassBtnEnabled = true;
      emit(ForgetPassBtnValidationState(isBtnEnabled: forgetPassBtnEnabled));
    } else {
      forgetPassBtnEnabled = false;
      emit(ForgetPassBtnValidationState(isBtnEnabled: forgetPassBtnEnabled));
    }
  }

  void forgetPasswordRequest(BuildContext context) async {
    if (forgetPassFormKey.currentState?.validate() ?? false) {
      emit(ForgetPassLoadingState());
      var response = await forgetPasswordUseCase.invoke(
        email: emailController.text,
        networkError: context.l10n.network_error,
        serverError: context.l10n.server_error,
      );
      response.fold(
        (l) {
          emit(ForgetPassFailureState(error: l));
        },
        (r) {
          emit(ForgetPassSuccessState());
          pageController.animateToPage(
            1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          emit(OtpInitState());
        },
      );
    }
  }

  // otp body attributes and behaviors
  List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  bool otpBtnEnabled = false;

  void otpTextFieldOnChange(String value, int index, BuildContext context) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index - 1]);
    }
    validateOtpBtn();
  }

  void validateOtpBtn() {
    otpBtnEnabled = !otpControllers.any(
      (controller) => controller.text.isEmpty,
    );
    emit(OtpBtnValidationState(isBtnEnabled: otpBtnEnabled));
  }

  void onPasteOtp(pastedText) {
    final characters = pastedText.split('');
    for (int i = 0; i < otpControllers.length; i++) {
      if (i < characters.length) {
        otpControllers[i].text = characters[i];
      } else {
        otpControllers[i].clear();
      }
    }
    otpFocusNodes.last.requestFocus();
    validateOtpBtn();
  }

  void otpValidationRequest(BuildContext context) async {
    emit(OtpLoadingState());
    var either = await verifyResetCodeUseCase.invoke(
      resetCode: otpControllers.map((controller) => controller.text).join(),
    );
    either.fold(
      (l) {
        emit(OtpFailureState(error: l));
      },
      (r) {
        emit(OtpSuccessState());
        pageController.animateToPage(
          2,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        emit(ResetPassInitState());
      },
    );
  }

  void resendOtp(BuildContext context) async {
    emit(OtpLoadingState());
    var either = await forgetPasswordUseCase.invoke(
      email: emailController.text,
      networkError: context.l10n.network_error,
      serverError: context.l10n.server_error,
    );
    either.fold(
      (l) {
        emit(OtpFailureState(error: l));
      },
      (r) {
        emit(ForgetPassSuccessState());
      },
    );
  }

  // resetPassword body attributes and behaviors
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool resetPassBtnEnabled = false;
  GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();

  void validateResetPassBtn() {
    if (newPassword.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty &&
        newPassword.text != '' &&
        confirmPassword.text != '') {
      resetPassBtnEnabled = true;
      emit(ResetPassBtnValidationState(isBtnEnabled: resetPassBtnEnabled));
    } else {
      resetPassBtnEnabled = false;
      emit(ResetPassBtnValidationState(isBtnEnabled: resetPassBtnEnabled));
    }
  }

  void newPassRequest(BuildContext context) async {
    if (resetPassFormKey.currentState?.validate() ?? false) {
      emit(ResetPassLoadingState());
      var either = await resetPasswordUseCase.invoke(
        email: emailController.text,
        newPassword: newPassword.text,
        networkError: context.l10n.network_error,
        serverError: context.l10n.server_error,
      );
      either.fold(
        (l) {
          emit(ResetPassFailureState(error: l));

          //todo: implement navigation to login screen
        },
        (r) {
          emit(ResetPassSuccessState());
        },
      );
    }
  }
}
