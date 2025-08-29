import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import '../cubit/login_cubit.dart';

class LoginButtom extends StatelessWidget {
  LoginCubit signInViewModel = getIt<LoginCubit>();

  LoginButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ElevatedButton(
        onPressed: () {
          if (signInViewModel.formKey.currentState!.validate()) {
            signInViewModel.login();
          }
        },
        child: Text(context.l10n.login),
      ),
    );
  }
}
