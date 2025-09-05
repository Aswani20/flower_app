import 'package:flower_app/core/dialog/dialog.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/core/theme/app_validator.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/forget_password/cubit/forget_password_states.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/forget_password/cubit/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordComponent extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;

 const ResetPasswordComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel,
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.resetPassFormKey,
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.l10n.reset_password,
                      style: AppStyles.medium18black,
                      textAlign: TextAlign.center,
                    ),
                    16.heightBox,
                    Text(
                      context.l10n.reset_password_body,
                      style: AppStyles.regular14grey,
                      textAlign: TextAlign.center,
                    ),
                    32.heightBox,
                    TextFormField(
                      controller: viewModel.newPassword,
                      validator: (value) =>
                          AppValidators.passwordValidator(value, context),
                      onChanged: (value) => viewModel.validateResetPassBtn(),
                      style: AppStyles.regular16black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: context.l10n.enter_your_password,
                        hintStyle: AppStyles.regular14grey,
                        labelText: context.l10n.new_password,
                        labelStyle: AppStyles.regular14black,
                      ),
                    ),
                    24.heightBox,
                    TextFormField(
                      controller: viewModel.confirmPassword,
                      validator: (value) =>
                          AppValidators.confirmPasswordValidator(
                            value,
                            viewModel.newPassword,
                            context,
                          ),
                      style: AppStyles.regular16black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: context.l10n.confirmPassword,
                        hintStyle: AppStyles.regular14grey,
                        labelText: context.l10n.confirmPasswordHint,
                        labelStyle: AppStyles.regular14black,
                      ),
                    ),
                    48.heightBox,
                    ElevatedButton(
                      onPressed: viewModel.resetPassBtnEnabled
                          ? () {
                              //todo: implement forget password api and go to otp body
                              viewModel.newPassRequest(context);
                            }
                          : null,
                      child: Text(
                        context.l10n.confirm,
                        style: AppStyles.medium16white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is ResetPassLoadingState) {
          // Show loading indicator
          DialogUtils.showLoading(
            context: context,
            loadingMessage: context.l10n.loading,
          );
        } else if (state is ResetPassSuccessState) {
          DialogUtils.hideLoading(context);
          //todo: implement reset password success logic, e.g., navigate to login screen
          DialogUtils.showMessage(
            context: context,
            content: context.l10n.reset_pass_success,
            posActions: context.l10n.ok,
          );
        } else if (state is ResetPassFailureState) {
          // Hide loading indicator and show error message
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            title: context.l10n.error,
            content: state.error.errorMessage,
            negActions: context.l10n.ok,
          );
        }
      },
    );
  }
}
