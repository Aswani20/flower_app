import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchSection extends StatelessWidget {
  final void Function(String)? onChanged;

  const HomeSearchSection({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.svg.circleFlower,
          width: 24.w,
          height: 24.h,
        ),
        Text(
          AppLocalizations.of(context)!.flowery,

          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: context.l10n.search,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
            ),
            // onChanged: (value) {
            //   setState(() {});
            //   Future.delayed(
            //     const Duration(milliseconds: 500),
            //     () {
            //       if (value.trim() ==
            //           widget.controller.text.trim()) {
            //         context
            //             .read<SearchCubit>()
            //             .searchProducts(value);
            //       }
            //     },
            //   );
            // },
            // onSubmitted: (value) => context
            //     .read<SearchCubit>()
            //     .searchProducts(value),
          ),
        ),
      ],
    );
  }
}
