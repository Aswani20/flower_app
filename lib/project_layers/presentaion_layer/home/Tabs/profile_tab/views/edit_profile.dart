import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/extensions/navigator_extensions.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_theme.dart';
import 'package:flower_app/core/utils/widgets/app_text_form_feild.dart';
import 'package:flower_app/core/utils/widgets/custom_button.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/cubits/profile/profile_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/widgets/slect_gender_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/dialog/dialog.dart';
import '../../../../../domain_layer/entities/get_logged_user_entity.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    final user =
        ModalRoute.of(context)?.settings.arguments
            as GetLoggedUserEntity?;

    return BlocProvider(
      create: (context) =>
          getIt<ProfileCubit>()..initializeWithUser(user),
      child: EditProfileView(gender: user?.gender ?? ""),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    required this.gender,
    super.key,
  });

  final String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(context.l10n.editProfile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is UpdateUserProfileLoading ||
                state is PhotoChangedLoadingState) {
              DialogUtils.showLoading(
                context: context,
                loadingMessage: context.l10n.loading,
              );
            } else if (state
                is UpdateUserProfileSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor:
                      AppTheme.lightTheme.primaryColor,
                  content: Text(
                    context
                        .l10n
                        .profile_updated_successfully,
                  ),
                ),
              );
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.loginScreen,
              );
            } else if (state is PhotoChangedSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor:
                      AppTheme.lightTheme.primaryColor,
                  content: Text(
                    context
                        .l10n
                        .photo_updated_successfully,
                  ),
                ),
              );
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.loginScreen,
              );
            } else if (state is UpdateUserProfileError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is PhotoChangedError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        BlocBuilder<
                          ProfileCubit,
                          ProfileState
                        >(
                          builder: (context, state) {
                            final cubit = context
                                .read<ProfileCubit>();
                            return ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(
                                    100.r,
                                  ),

                              child:
                                  cubit.selectedImageFile !=
                                      null
                                  ? Image.file(
                                      cubit
                                          .selectedImageFile!,
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.fill,
                                    )
                                  : cubit.photo.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          cubit.photo,
                                      fit: BoxFit.fill,
                                      width: 100.w,
                                      height: 100.h,
                                      placeholder:
                                          (
                                            context,
                                            url,
                                          ) => const Center(
                                            child:
                                                CircularProgressIndicator(),
                                          ),
                                      errorWidget:
                                          (
                                            context,
                                            url,
                                            error,
                                          ) => const Center(
                                            child: Icon(
                                              Icons.error,
                                            ),
                                          ),
                                    )
                                  : Image.asset(
                                      Assets
                                          .icons
                                          .profileIcon
                                          .path,
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.fill,
                                    ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.deepOrangeAccent,
                              borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<ProfileCubit>()
                                    .changeUserPhoto();
                              },
                              child: SvgPicture.asset(
                                Assets.svg.camera,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 3.heightPercent(context),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFormFeild(
                          hintText:
                              context.l10n.firstName,
                          controller: context
                              .read<ProfileCubit>()
                              .firstNameController,
                          validator: (value) {},
                        ),
                      ),
                      SizedBox(
                        width: 6.widthPercent(context),
                      ),
                      Expanded(
                        child: AppTextFormFeild(
                          hintText: context.l10n.lastName,
                          controller: context
                              .read<ProfileCubit>()
                              .lastNameController,
                          validator: (value) {},
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 2.heightPercent(context),
                  ),
                  AppTextFormFeild(
                    hintText: context.l10n.email,
                    controller: context
                        .read<ProfileCubit>()
                        .emailController,
                  ),
                  SizedBox(
                    height: 2.heightPercent(context),
                  ),
                  AppTextFormFeild(
                    hintText: context.l10n.phoneNumber,
                    controller: context
                        .read<ProfileCubit>()
                        .phoneController,
                  ),
                  SizedBox(
                    height: 2.heightPercent(context),
                  ),
                  AppTextFormFeild(
                    isObscureText: true,
                    controller: TextEditingController(
                      text: "      ",
                    ),
                    suffixIcon: TextButton(
                      onPressed: () {
                        context.pushNamed(
                          AppRoutes.resetPassword,
                        );
                      },
                      child: Text(context.l10n.change),
                    ),
                    hintText: context.l10n.passwordHint,
                  ),
                  SizedBox(
                    height: 1.5.heightPercent(context),
                  ),
                  ChoseGenderProfile(
                    selectedGender: gender,
                  ),

                  CustomButton(
                    size: Size(double.infinity, 48.h),
                    borderRadius: 25.r,
                    child: Text(context.l10n.update),
                    onPressed: () {
                      context
                          .read<ProfileCubit>()
                          .updateUserProfile();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
