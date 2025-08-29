import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        switch (state) {
          /// TODO: show loading component here /// Elbar Sidaty
          case SignupLoading():
            Center(child: CircularProgressIndicator());
            break;
          case SignupSuccess():

            /// TODO: show real snackbar message /// Elbar Sidaty
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('sign up successfully'),
              ),
            );

            /// TODO: navigate to login /// Elbar Sidaty
            //   context.pushNamed(AppRoutes.loginScreen);
            break;
          case SignupError():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          default:
            return;
        }
      },
      child: Container(),
    );
  }
}
