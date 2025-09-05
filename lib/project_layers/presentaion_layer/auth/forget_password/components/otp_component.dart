import 'package:flower_app/core/dialog/dialog.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/input_formatter/paste_input_formatter.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/forget_password/cubit/forget_password_states.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/forget_password/cubit/forget_password_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpComponent extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;
  const OtpComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: viewModel,
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.05,
              ).copyWith(top: context.height * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.l10n.email_verification,
                      style: AppStyles.medium18black,
                      textAlign: TextAlign.center,
                    ),
                    16.heightBox,
                    Text(
                      context.l10n.enter_code_sent_to_email,
                      style: AppStyles.regular14grey,
                      textAlign: TextAlign.center,
                    ),
                    32.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          height: context.height*0.1,
                          width: context.width*0.15,
                          child: TextField(
                            onChanged: (value) {
                              // Handle text field change
                              viewModel.otpTextFieldOnChange(
                                value,
                                index,
                                context,
                              );
                            },
                            controller: viewModel.otpControllers[index],
                            focusNode: viewModel.otpFocusNodes[index],
                            style: AppStyles.regular16black,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            obscureText: true,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                fillColor:
                                state is! OtpFailureState
                                    ? AppColors.pink[10]
                                    : AppColors.white,
                              border:
                              state is OtpFailureState
                                  ? OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.red,
                                ),
                              )
                                  : OutlineInputBorder(),
                              enabledBorder:
                              state is OtpFailureState
                                  ? OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.red,
                                ),
                              )
                                  : OutlineInputBorder(),
                              focusedBorder:
                              state is OtpFailureState
                                  ? OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.red,
                                ),
                              )
                                  : OutlineInputBorder(),
                            ),

                            inputFormatters: [
                              PasteInputFormatter(onPaste: viewModel.onPasteOtp)
                            ],
                          ),
                        );
                      }),
                    ),
                    if (state is! OtpFailureState) SizedBox(height: 5),
                    if (state is OtpFailureState)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            context.l10n.invalid_code,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                    24.heightBox,
                    FilledButton(
                      onPressed:
                      viewModel.otpBtnEnabled
                          ? () {
                        //todo: go to reset password body
                        viewModel.otpValidationRequest(context);
                      }
                          : null,
                      child: Text(context.l10n.continue_btn),
                    ),
                    24.heightBox,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "${context.l10n.didnt_receive_code} ",
                        style: AppStyles.regular16black,
                        children: [
                          TextSpan(
                            text: context.l10n.resend,
                            style: AppStyles.regular16black.copyWith(color: AppColors.pink),
                            recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                viewModel.resendOtp(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      listener: (context, state) {
        if (state is OtpLoadingState) {
          // Show loading indicator
          DialogUtils.showLoading(
            context: context,
            loadingMessage: context.l10n.loading,
          );
        } else if (state is OtpSuccessState) {
          DialogUtils.hideLoading(context);
        } else if (state is ForgetPassSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: context.l10n.otp_resend_to_mail,
            negActions: context.l10n.ok,
          );
        } else if (state is OtpFailureState) {
          // Hide loading indicator and show error message
          DialogUtils.hideLoading(context);
        }
      },
    );
  }
}
