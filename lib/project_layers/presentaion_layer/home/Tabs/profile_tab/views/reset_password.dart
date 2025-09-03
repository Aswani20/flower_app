import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/utils/widgets/custom_button.dart';
import 'package:flower_app/project_layers/api_layer/models/request/change_password_request_body.dart';

import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/cubits/reset/cubit/reset_password_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/widgets/reset_password_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() =>
      _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late final TextEditingController passwordController;
  late final TextEditingController newPasswordController;
  late final ResetPasswordCubit resetPasswordCubit;
  late final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
    resetPasswordCubit = getIt<ResetPasswordCubit>();
  }

  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => resetPasswordCubit,
      child:
          BlocConsumer<
            ResetPasswordCubit,
            ResetPasswordState
          >(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    context.l10n.reset_password,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ResetPasswordForm(
                        passwordController:
                            passwordController,
                        newPasswordController:
                            newPasswordController,
                        formKey: formKey,
                      ),
                      SizedBox(
                        height: 2.5.heightPercent(
                          context,
                        ),
                      ),
                      CustomButton(
                        size: Size(double.infinity, 48),
                        borderRadius: 30,
                        child: Text(context.l10n.update),
                        onPressed: () {
                          if (formKey.currentState!
                              .validate()) {
                            resetPasswordCubit
                                .changePassword(
                                  ChangePasswordRequestBody(
                                    passwordController
                                        .text,

                                    newPasswordController
                                        .text,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {
              switch (state) {
                case ChangePasswordLoading():
                  Center(
                    child:
                        CircularProgressIndicator.adaptive(),
                  );
                  break;
                case ChangePasswordSuccess():
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    SnackBar(
                      content: Text(
                        context.l10n.reset_pass_success,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                  break;
                case ChangePasswordError():
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );

                  break;
                default:
              }
            },
          ),
    );
  }
}
