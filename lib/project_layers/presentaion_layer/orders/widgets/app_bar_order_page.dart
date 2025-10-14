import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class AppBarOrderPage extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.l10n.myOrders,
        style: Theme.of(context).textTheme.headlineMedium,
      ),

      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(56 + 10);
}
