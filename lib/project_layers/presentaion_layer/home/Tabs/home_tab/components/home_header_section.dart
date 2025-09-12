import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    super.key,
    this.onPressed,
    required this.sectionTitle,
  });

  final void Function()? onPressed;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(sectionTitle, style: Theme.of(context).textTheme.bodyLarge),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.view_all,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.pink,
            ),
          ),
        ),
      ],
    );
  }
}
