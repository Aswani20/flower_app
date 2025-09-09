import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/dialog/dialog.dart';
import '../../../../core/route/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_validator.dart';
import 'cubit/login_cubit.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  LoginCubit signInViewModel = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: signInViewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Icon(Icons.arrow_back_ios),
            ),
            leadingWidth: 20,
            title: Text(context.l10n.login),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  16.heightBox,
                  Form(
                    key: signInViewModel.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) =>
                              signInViewModel
                                  .checkFormValidity(),
                          validator: (value) =>
                              AppValidators.nonEmptyField(
                                value,
                                context,
                              ),
                          controller: signInViewModel
                              .emailController,
                          decoration: InputDecoration(
                            labelText: context.l10n.email,
                            hintText:
                                context.l10n.emailHint,
                          ),
                        ),
                        20.heightBox,

                        TextFormField(
                          onChanged: (value) =>
                              signInViewModel
                                  .checkFormValidity(),
                          validator: (value) =>
                              AppValidators.passwordValidator(
                                value,
                                context,
                              ),
                          controller: signInViewModel
                              .passwordController,
                          obscureText: signInViewModel
                              .isObscureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  signInViewModel
                                          .isObscureText =
                                      !signInViewModel
                                          .isObscureText;
                                });
                              },
                              icon: Icon(
                                color: AppColors.black,
                                signInViewModel
                                        .isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            labelText:
                                context.l10n.password,
                            hintText:
                                context.l10n.passwordHint,
                          ),
                        ),
                        25.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                value: signInViewModel
                                    .isRememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    signInViewModel
                                        .toggleRememberMe(
                                          value ?? false,
                                        );
                                  });
                                },
                                title: Text(
                                  context
                                      .l10n
                                      .remember_me,
                                ),
                                controlAffinity:
                                    ListTileControlAffinity
                                        .leading,
                                contentPadding:
                                    EdgeInsets.zero,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes
                                      .forgetPasswordScreen,
                                );
                              },
                              child: Text(
                                "${context.l10n.forget_password}?",
                                style: const TextStyle(
                                  color: AppColors.black,
                                  decoration:
                                      TextDecoration
                                          .underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        30.heightBox,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              context.width,
                              50,
                            ),
                          ),
                          onPressed: () {
                            if (signInViewModel
                                .formKey
                                .currentState!
                                .validate()) {
                              signInViewModel.login();
                            }
                          },
                          child: Text(context.l10n.login),
                        ),
                        16.heightBox,
                        SizedBox(
                          width: context.width,
                          child: OutlinedButton(
                            onPressed: () {
                              signInViewModel
                                  .loginAsGuest(context);
                            },
                            child: Text(
                              context.l10n.login_as_guest,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        16.heightBox,

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Text(
                              context.l10n.dont_have_account,
                              style: const TextStyle(
                                color: AppColors.black,
                              ),
                            ),
                            8.widthBox,
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.signUpScreen,
                                );
                              },
                              child: Text(
                                context.l10n.signUp,
                                style: const TextStyle(
                                  color: AppColors.pink,
                                  decoration:
                                      TextDecoration
                                          .underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginLoading) {
          DialogUtils.showLoading(
            context: context,
            loadingMessage: "loading",
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.response.message ?? "Success",
            posActions: "OK",
            posFunction: (p0) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.homeScreen,
              );
            },
          );
        } else if (state is GuestLoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: "Logged in as Guest",
            posActions: "OK",
            posFunction: (p0) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.homeScreen,
              );
            },
          );
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
            negActions: "OK",
          );
        }
      },
    );
  }
}
