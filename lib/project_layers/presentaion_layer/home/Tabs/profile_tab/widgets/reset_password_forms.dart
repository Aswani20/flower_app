import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_validator.dart';
import 'package:flower_app/core/utils/widgets/app_text_form_feild.dart';
import 'package:flutter/material.dart';

class ResetPasswordForm extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController newPasswordController;
  final TextEditingController? confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const ResetPasswordForm({
    super.key,
    this.confirmPasswordController,
    required this.passwordController,
    required this.newPasswordController,
    required this.formKey,
  });

  @override
  ResetPasswordFormState createState() =>
      ResetPasswordFormState();
}

class ResetPasswordFormState
    extends State<ResetPasswordForm> {
  bool _passwordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Text(
            context
                .l10n
                .passwordMustContainUpperLowerAndSpecialCharacter,
            style: Theme.of(context).textTheme.bodyMedium!
                .copyWith(color: AppColors.grey),
          ),
          SizedBox(height: 2.heightPercent(context)),
          AppTextFormFeild(
            isObscureText: !_passwordVisible,
            controller: widget.passwordController,
            hintText: context.l10n.currentPassword,

            validator: (value) =>
                AppValidators.passwordValidator(
                  value,
                  context,
                ),
            suffixIcon: InkWell(
              child: Icon(
                _passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          SizedBox(height: 2.heightPercent(context)),

          AppTextFormFeild(
            isObscureText: !_newPasswordVisible,
            controller: widget.newPasswordController,
            hintText: context.l10n.new_password,

            validator: (value) =>
                AppValidators.passwordValidator(
                  value,
                  context,
                ),
            suffixIcon: InkWell(
              child: Icon(
                _newPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _newPasswordVisible =
                      !_newPasswordVisible;
                });
              },
            ),
          ),
          SizedBox(height: 2.heightPercent(context)),
          AppTextFormFeild(
            isObscureText: !_confirmPasswordVisible,
            controller: widget.confirmPasswordController,
            hintText: context.l10n.confirmPassword,

            validator: (value) =>
                AppValidators.confirmPasswordValidator(
                  value,
                  widget.newPasswordController,
                  context,
                ),
            suffixIcon: InkWell(
              child: Icon(
                _confirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _confirmPasswordVisible =
                      !_confirmPasswordVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
