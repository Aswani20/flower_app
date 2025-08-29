import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import 'widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.signUp)),
      body: SafeArea(child: SignUpBody()),
    );
  }
}
