import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  int itemNumbers = 0;

  CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios_new),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.l10n.cart,
                style: AppStyles.appBarTitleStyle,
              ),
              TextSpan(
                text:
                    ' ($itemNumbers ${context.l10n.items})',
                style: AppStyles.appBarTitleStyle
                    .copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
