import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class SearchInitialView extends StatelessWidget {
  const SearchInitialView({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          size: 80,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 16),
        Text(
          context.l10n.searchForYourFavoriteProducts,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          context.l10n.searchHint,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );
}
