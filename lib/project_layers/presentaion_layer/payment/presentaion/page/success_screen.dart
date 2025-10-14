import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Lottie.asset(
              Assets.svg.eIeNuVRaYz,
              repeat: true,
              reverse: false,
              animate: true,
            ),
            Text(
              context.l10n.your_order_placed,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "${context.l10n.successfully}!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            30.heightBox,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
              },
              child: Text("Back to ${context.l10n.home}"),
            ),
          ],
        ),
      ),
    );
  }
}
