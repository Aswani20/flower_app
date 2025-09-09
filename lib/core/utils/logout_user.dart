import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/core/di/modules/shared_preferences_module.dart';
import 'package:flower_app/core/keys/shared_key.dart';
import 'package:flower_app/core/route/app_routes.dart';

Future<void> logoutUser(BuildContext context) async {
  final shouldLogout = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(context.l10n.confirmLogout),
      content: Text(
        context.l10n.areYouSureYouWantToLogOut,
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(false),
          child: Text(context.l10n.cancel),
        ),
        ElevatedButton(
          onPressed: () =>
              Navigator.of(context).pop(true),
          child: Text(context.l10n.logOut),
        ),
      ],
    ),
  );

  if (shouldLogout ?? false) {
    await SharedPrefHelper().removePreference(
      key: SharedPrefKeys.tokenKey,
    );

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (route) => false,
    );
  }
}
