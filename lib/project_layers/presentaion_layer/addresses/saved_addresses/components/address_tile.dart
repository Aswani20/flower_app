import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    required this.addressEntity,
    super.key,
  });

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 16.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      title: Row(
        children: [
          SvgPicture.asset(Assets.svg.location),
          Text(
            addressEntity.city ?? '',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black[500],
            ),
          ),
          Spacer(),

          SvgPicture.asset(Assets.svg.delete),
          SvgPicture.asset(Assets.svg.edit),
        ],
      ),
      subtitle: Text(
        '${addressEntity.street ?? ''} ${addressEntity.city ?? ''}',
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
