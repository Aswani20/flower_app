import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

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