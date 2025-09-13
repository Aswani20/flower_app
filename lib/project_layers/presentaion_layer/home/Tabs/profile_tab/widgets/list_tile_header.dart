import 'package:flower_app/core/extensions/navigator_extensions.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/language_cubit.dart';
import '../../../../../../core/utils/logout_user.dart';

class ListTileHeader extends StatelessWidget {
  const ListTileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = Localizations.localeOf(
      context,
    ).languageCode;

    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.OrdersPage,
            );
          },
          leading: Icon(
            Icons.favorite_border_outlined,
            size: 24.w,
          ),

          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 23.w,
          ),
          title: Text(
            context.l10n.myOrders,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.savedAddresses,
            );
          },
          leading: Icon(
            Icons.location_on_outlined,
            size: 24.w,
          ),

          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 23.w,
          ),
          title: Text(
            context.l10n.savedAddresses,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Divider(thickness: 0.3, color: AppColors.grey),
        ListTile(
          onTap: () {
            //here settings of notification
          },
          leading: Switch(
            value: true,
            onChanged: (value) {},
          ),

          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 23.w,
          ),
          title: Text(
            context.l10n.notification,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Divider(thickness: 0.3, color: AppColors.grey),
        ListTile(
          onTap: () {
            if (currentLang == "en") {
              context.read<LocaleCubit>().changeLang(
                "ar",
              );
            } else {
              context.read<LocaleCubit>().changeLang(
                "en",
              );
            }
          },
          leading: Icon(
            Icons.language_rounded,
            size: 24.w,
          ),
          trailing: Text(
            currentLang == "en" ? "English" : "العربية",
            style: Theme.of(context).textTheme.bodyMedium!
                .copyWith(color: AppColors.pink),
          ),
          title: Text(
            currentLang == "en" ? "Language" : "اللغة",

            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ListTile(
          onTap: () {
            //chackoutView
            context.pushNamed(AppRoutes.aboutUs);
          },
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 23.w,
          ),
          title: Text(
            context.l10n.aboutUs,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ListTile(
          onTap: () {
            context.pushNamed(
              AppRoutes.termsAndConditions,
            );
          },
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 23.w,
          ),
          title: Text(
            context.l10n.termsAndConditions,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Divider(thickness: 0.3, color: AppColors.grey),
        ListTile(
          onTap: () {
            logoutUser(context);
          },
          leading: Icon(
            Icons.logout_outlined,
            size: 24.w,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 23.w,
          ),
          title: Text(
            context.l10n.logOut,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
