import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/route/app_routes.dart';
import '../../../core/theme/app_colors.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.l10n.notHaveAccount,
          style: const TextStyle(color: AppColors.black),
        ),
        8.widthBox,
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.signUpScreen);
          },
          child: Text(
            context.l10n.signUp,
            style: const TextStyle(
              color: AppColors.pink,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
