
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CartDeliverToAddress extends StatelessWidget {
  const CartDeliverToAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        ImageIcon(Assets.icons.locationIcon.provider()),
        Text(
          context.l10n.deliver_to,
          style: AppStyles.medium16grey,
        ),
        Expanded(
          child: Text(
            '2XVP+XC - Sheikh Zayed.....',
            style: AppStyles.medium16grey.copyWith(
              color: AppColors.black,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            Assets.icons.arrowDrop.provider(),
          ),
        ),
      ],
    );
  }
}
