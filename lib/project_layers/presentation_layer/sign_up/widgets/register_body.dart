import 'package:flower_app/core/utils/widgets/main_bottom.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/cubit/sign_up_cubit.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/widgets/aleady_have_an_account.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/widgets/register_bloc_lisetner.dart';
import 'package:flower_app/project_layers/presentation_layer/sign_up/widgets/register_forms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Register now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                const RegisterForm(),
                //  verticalSpace(40),
                SizedBox(height: 40),
                MainBottom(
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                  buttonText: "Create Account",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //     verticalSpace(16),
                //  //   const TermsAndConditionsText(),
                //     verticalSpace(30),
                const AlreadyHaveAccountText(),
                const RegisterBlocListener(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().register();
    }
  }
}
