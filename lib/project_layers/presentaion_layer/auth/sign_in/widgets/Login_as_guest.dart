import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../cubit/login_cubit.dart';

// ignore: must_be_immutable
class LoginAsGuest extends StatelessWidget {
  LoginCubit signInViewModel = getIt<LoginCubit>();

  LoginAsGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: OutlinedButton(
        onPressed: () {
          signInViewModel.loginAsGuest(context);
        },
        child: const Text(
          "Login as Guest",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
