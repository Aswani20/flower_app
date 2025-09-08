import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoseGender extends StatelessWidget {
  const ChoseGender({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SignUpCubit>();
    return Row(
      children: [
        Text(
          'Gender',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20),
        Flexible(
          flex: 2,
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Female',
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            value: "female",
            groupValue: cubit.selectedGender,
            onChanged: (value) {
              cubit.selectGender(value!);
            },
            activeColor: AppColors.pink,
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
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            value: "male",
            groupValue: cubit.selectedGender,
            onChanged: (value) {
              cubit.selectGender(value!);
            },
            activeColor: AppColors.pink,
          ),
        ),
      ],
    );
  }
}
