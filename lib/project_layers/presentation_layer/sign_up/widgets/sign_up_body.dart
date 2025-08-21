import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/utils/widgets/custom_button.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/cubit/sign_up_cubit.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/widgets/sign_up_bloc_lisetner.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/widgets/sign_up_feorms.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/widgets/slect_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SignUpFields(),
            SizedBox(height: 20),
            ChoseGender(),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return CustomButton(
                  size: Size(context.width, 48),
                  borderRadius: 100,
                  onPressed: () {
                    validateThenDoSignup(context);
                  },

                  child: state is SignupLoading
                      ? CircularProgressIndicator(
                          color: AppColors.white,
                        )
                      : Text(context.l10n.signUp),
                );
              },
            ),

            SignUpBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context
        .read<SignUpCubit>()
        .signUpFormKey
        .currentState!
        .validate()) {
      context.read<SignUpCubit>().signUp();
    }
  }
}
