import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    this.onTap,
    this.bestSeller,
    this.occasion,
    super.key,
  });

  final void Function()? onTap;
  final BestSellerEntity? bestSeller;
  final OccasionEntity? occasion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CachedNetworkImage(
            imageUrl:
                bestSeller?.imgCover ??
                "https://flower.elevateegy.com/uploads/${occasion?.image ?? ''}",
            fit: BoxFit.cover,
            width: 130.w,
            height: 140.h,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(
            top: 6.h,
            bottom: 4.h,
          ),
          child: Text(
            bestSeller?.title ?? occasion?.name ?? '',
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: AppColors.black[300]),
          ),
        ),
        if (bestSeller != null)
          Text(
            '${bestSeller?.price} ${AppLocalizations.of(context)!.egp}',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(
                  color: AppColors.black[500],

                  fontSize: 14.sp,
                ),
          ),
      ],
    );
  }
}
