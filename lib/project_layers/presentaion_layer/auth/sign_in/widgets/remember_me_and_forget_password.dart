import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../cubit/login_cubit.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  LoginCubit signInViewModel = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
            value: signInViewModel.isRememberMe,
            onChanged: (value) {
              setState(() {
                signInViewModel.toggleRememberMe(value ?? false);
              });
            },
            title: const Text("Remember me"),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.forgetPasswordScreen);
          },
          child: Text(
            "${context.l10n.forget_password}?",
            style: const TextStyle(
              color: AppColors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
