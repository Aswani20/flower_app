import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChoseGenderProfile extends StatelessWidget {
  const ChoseGenderProfile({
    required this.selectedGender,
    super.key,
  });

  final String selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Gender',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(width: 20),
        Flexible(
          flex: 2,
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Female',
              maxLines: 1,
              style: Theme.of(
                context,
              ).textTheme.titleMedium,
            ),
            value: 'female',
            groupValue: selectedGender,
            activeColor: AppColors.pink,
            onChanged: (String? value) {},
          ),
        ),
        Flexible(
          flex: 2,
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              'Male',
              style: Theme.of(
                context,
              ).textTheme.titleMedium,
            ),
            value: 'male',
            groupValue: selectedGender,
            activeColor: AppColors.pink,
            onChanged: (String? value) {},
          ),
        ),
      ],
    );
  }
}
