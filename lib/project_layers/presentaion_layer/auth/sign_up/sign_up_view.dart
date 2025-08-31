import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<SignUpCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n.signUp)),
        body: SafeArea(child: SignUpBody()),
      ),
    );
  }
}
