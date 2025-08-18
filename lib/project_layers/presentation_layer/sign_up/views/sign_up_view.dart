import 'package:flower_app/project_layers/presentation_layer/sign_up/widgets/register_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: RegisterBody()));
  }
}
