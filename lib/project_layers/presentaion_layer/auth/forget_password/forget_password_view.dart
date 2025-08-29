import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/forget_password_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/reset_password_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/verify_reset_code_use_case.dart';
import 'package:flutter/material.dart';
import 'components/forget_password_component.dart';
import 'components/otp_component.dart';
import 'components/reset_password_component.dart';
import 'cubit/forget_password_view_model.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  ForgetPasswordViewModel forgetPasswordViewModel = ForgetPasswordViewModel(
    forgetPasswordUseCase: getIt<ForgetPasswordUseCase>(),
    verifyResetCodeUseCase: getIt<VerifyResetCodeUseCase>(),
    resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: context.width * 0.04),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        leadingWidth: context.width * 0.09,
        title: Text(context.l10n.password, style: AppStyles.appBarTitleStyle),
      ),
      body: PageView(
        controller: forgetPasswordViewModel.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ForgetPasswordComponent(viewModel:forgetPasswordViewModel ,),
          OtpComponent(viewModel:forgetPasswordViewModel ,),
          ResetPasswordComponent(viewModel:forgetPasswordViewModel ,),
        ],
      ),
    );
  }
}
