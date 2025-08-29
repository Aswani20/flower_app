import 'package:flower_app/core/dialog/dialog.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/core/theme/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/forget_password_states.dart';
import '../cubit/forget_password_view_model.dart' show ForgetPasswordViewModel;

class ForgetPasswordComponent extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;

  ForgetPasswordComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel,
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
            child: Form(
              key: viewModel.forgetPassFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.l10n.forget_password,
                      style: AppStyles.medium18black,
                      textAlign: TextAlign.center,
                    ),
                    16.heightBox,
                    Text(
                      context.l10n.enter_your_email_associated,
                      style: AppStyles.regular14grey,
                      textAlign: TextAlign.center,
                    ),
                    32.heightBox,
                    TextFormField(
                      validator: (value) =>
                          AppValidators.emailValidator(value, context),
                      onChanged: (value) => viewModel.validateForgetPassBtn(),
                      controller: viewModel.emailController,
                      style: AppStyles.regular16black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: context.l10n.emailHint,
                        hintStyle: AppStyles.regular14grey,
                        labelText: context.l10n.email,
                        labelStyle: AppStyles.regular14black,
                      ),
                    ),
                    48.heightBox,
                    ElevatedButton(
                      onPressed: viewModel.forgetPassBtnEnabled
                          ? () => viewModel.forgetPasswordRequest(context)
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
        if (state is ForgetPassLoadingState) {
          // Show loading indicator
          DialogUtils.showLoading(
            context: context,
            loadingMessage: context.l10n.loading,
          );
        } else if (state is ForgetPassSuccessState) {
          DialogUtils.hideLoading(context);
        } else if (state is ForgetPassFailureState) {
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
