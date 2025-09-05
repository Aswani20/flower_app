import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_validator.dart';
import 'package:flutter/material.dart';
import '../cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {

 const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  LoginCubit signInViewModel = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) => signInViewModel.checkFormValidity(),
          validator: (value) => AppValidators.nonEmptyField(value, context),
          controller: signInViewModel.emailController,
          decoration: InputDecoration(
            labelText: context.l10n.email,
            hintText: context.l10n.emailHint,
          ),
        ),
        20.heightBox,

        TextFormField(
          onChanged: (value) => signInViewModel.checkFormValidity(),
          validator: (value) => AppValidators.passwordValidator(value, context),
          controller: signInViewModel.passwordController,
          obscureText: signInViewModel.isObscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  signInViewModel.isObscureText =
                      !signInViewModel.isObscureText;
                });
              },
              icon: Icon(
                color: AppColors.black,
                signInViewModel.isObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            labelText: context.l10n.password,
            hintText: context.l10n.passwordHint,
          ),
        ),
      ],
    );
  }
}
