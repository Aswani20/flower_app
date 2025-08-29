import 'package:flower_app/core/errors/failures.dart';

abstract class ForgetPassStates {}

// Initial states
class ForgetPassInitState extends ForgetPassStates {}

class OtpInitState extends ForgetPassStates {}

class ResetPassInitState extends ForgetPassStates {}

//Loading states
class ForgetPassLoadingState extends ForgetPassStates {}

class OtpLoadingState extends ForgetPassStates {}

class ResetPassLoadingState extends ForgetPassStates {}

// Btn validation state
class ForgetPassBtnValidationState extends ForgetPassStates {
  final bool isBtnEnabled;

  ForgetPassBtnValidationState({required this.isBtnEnabled});
}

class OtpBtnValidationState extends ForgetPassStates {
  final bool isBtnEnabled;

  OtpBtnValidationState({required this.isBtnEnabled});
}

class ResetPassBtnValidationState extends ForgetPassStates {
  final bool isBtnEnabled;

  ResetPassBtnValidationState({required this.isBtnEnabled});
}

// Success States
class ForgetPassSuccessState extends ForgetPassStates {
  ForgetPassSuccessState();
}

class OtpSuccessState extends ForgetPassStates {
  OtpSuccessState();
}

class ResetPassSuccessState extends ForgetPassStates {
  ResetPassSuccessState();
}

// Error States
class ForgetPassFailureState extends ForgetPassStates {
  final Failures error;

  ForgetPassFailureState({required this.error});
}

class OtpFailureState extends ForgetPassStates {
  final Failures error;

  OtpFailureState({required this.error});
}

class ResetPassFailureState extends ForgetPassStates {
  final Failures error;

  ResetPassFailureState({required this.error});
}
