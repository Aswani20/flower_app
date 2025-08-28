import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearch extends StatefulWidget {
  CustomSearch({super.key, this.onFieldSubmitted});

  void Function(String)? onFieldSubmitted;

  @override
  State<CustomSearch> createState() =>
      _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: context.l10n.search,
          hintStyle: TextStyle(color: AppColors.grey),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.pink,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
          ),
        ),
        // textInputAction: TextInputAction.search,
        // onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
