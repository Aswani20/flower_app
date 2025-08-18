import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: ' Login',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            recognizer: TapGestureRecognizer(),
            // ..onTap = () {
            //   context.pushReplacementNamed(Routes.loginPage);
            // },
          ),
        ],
      ),
    );
  }
}
