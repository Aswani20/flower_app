import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

import '../cubit/cart_view_model.dart';

class CardHeader extends StatefulWidget {
  int itemNumbers;

  CardHeader({super.key, required this.itemNumbers});

  @override
  State<CardHeader> createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios_new),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.l10n.cart,
                style: AppStyles.appBarTitleStyle,
              ),
              TextSpan(
                text:
                ' (${widget.itemNumbers} ${context.l10n.items})',
                style: AppStyles.appBarTitleStyle
                    .copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(onPressed: (){
          CartViewModel.get(context).getCart();
        }, icon: Icon(Icons.refresh))
      ],
    );
  }
}
