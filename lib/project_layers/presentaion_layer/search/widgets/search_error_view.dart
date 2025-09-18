import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchErrorView extends StatelessWidget {
  final String message;
  final String keyword;

  const SearchErrorView({
    super.key,
    required this.message,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 80,
          color: Colors.red[400],
        ),
        const SizedBox(height: 16),
        Text(
          context.l10n.search_error,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () =>
              context.read<SearchCubit>().refreshSearch(),
          child: const Text('إعادة المحاولة'),
        ),
      ],
    ),
  );
}
