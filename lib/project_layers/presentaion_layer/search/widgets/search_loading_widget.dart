import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class SearchLoadingView extends StatelessWidget {
  const SearchLoadingView({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator.adaptive(),
        SizedBox(height: 16),
        Text(
          context.l10n.searching,
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
