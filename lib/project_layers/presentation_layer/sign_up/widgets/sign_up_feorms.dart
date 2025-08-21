import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/utils/app_regex.dart';
import 'package:flower_app/core/utils/widgets/app_text_form_feild.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFields extends StatefulWidget {
  const SignUpFields({super.key});

  @override
  State<SignUpFields> createState() =>
      _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  bool isPasswordObscureText = true;
  bool isConfirmPasswordObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextFormFeild(
                  controller: context
                      .read<SignUpCubit>()
                      .firstNameController,
                  hintText: context.l10n.firstNameHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.firstNameHint;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: AppTextFormFeild(
                  controller: context
                      .read<SignUpCubit>()
                      .lastNameController,
                  hintText: context.l10n.lastNameHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.lastNameHint;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          AppTextFormFeild(
            controller: context
                .read<SignUpCubit>()
                .emailController,
            hintText: context.l10n.emailHint,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return context.l10n.firstNameHint;
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: AppTextFormFeild(
                  isObscureText: isPasswordObscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordObscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordObscureText =
                            !isPasswordObscureText;
                      });
                    },
                  ),
                  controller: context
                      .read<SignUpCubit>()
                      .passwordController,
                  hintText: context.l10n.passwordHint,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isPasswordValid(
                          value,
                        )) {
                      return context.l10n.firstNameHint;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: AppTextFormFeild(
                  isObscureText:
                      isConfirmPasswordObscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordObscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordObscureText =
                            !isConfirmPasswordObscureText;
                      });
                    },
                  ),
                  controller: context
                      .read<SignUpCubit>()
                      .confirmPasswordController,
                  hintText:
                      context.l10n.confirmPasswordHint,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isConfirmPasswordValid(
                          context
                              .read<SignUpCubit>()
                              .passwordController
                              .text,
                          value,
                        )) {
                      return context.l10n.firstNameHint;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          AppTextFormFeild(
            controller: context
                .read<SignUpCubit>()
                .phoneNumberController,
            hintText: context.l10n.phoneNumberHint,
            validator: (value) {
              if (value == null || value.isEmpty
              //!AppRegex.isPhoneNumberValid(value)
              ) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
