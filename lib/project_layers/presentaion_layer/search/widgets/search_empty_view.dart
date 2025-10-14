import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class SearchEmptyView extends StatelessWidget {
  final String keyword;

  const SearchEmptyView({
    super.key,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off,
          size: 80,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 16),
        Text(
          '${context.l10n.noResultFound} "$keyword"',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          context.l10n.trySearchWithDeffrentKeys,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}
