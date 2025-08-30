import 'package:flutter/material.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import '../../../../core/theme/app_styles.dart';

class AppBarBestSeller extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      toolbarHeight: 56,
      // default is 56
      title: Text("Best Seller", style: AppStyles.font20BlackW500),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10),

        child: Align(
          alignment: Alignment.topLeft,

          child: Padding(
            padding: const EdgeInsets.only(left: 56.0, bottom: 8.0),
            child: Text(
              "Bloom with our exquisite best sellers",
              style: AppStyles.font15BlackW500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56 + 10);
}
