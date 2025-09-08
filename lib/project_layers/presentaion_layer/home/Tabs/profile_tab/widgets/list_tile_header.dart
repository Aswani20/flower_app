import 'package:flower_app/core/extensions/navigator_extensions.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileHeader extends StatelessWidget {
  const ListTileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            //here go to my orders
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
            //here go to saved address
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
            //here go to language
          },
          leading: Icon(
            Icons.language_rounded,
            size: 24.w,
          ),

          trailing: Text(
            'English',
            style: Theme.of(context).textTheme.bodyMedium!
                .copyWith(color: AppColors.pink),
          ),
          title: Text(
            context.l10n.localeName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ListTile(
          onTap: () {
            //here go to about us
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
            //here go to log out
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
