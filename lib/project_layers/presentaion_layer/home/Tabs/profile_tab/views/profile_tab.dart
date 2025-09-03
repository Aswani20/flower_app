import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/navigator_extensions.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/cubits/profile/profile_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/widgets/list_tile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileCubit>()..getLoggedUserData(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svg.circleFlower,
                        width: 26.w,
                        height: 26.h,
                      ),
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.flowery,

                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(
                              color: AppColors.pink,
                            ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        size: 29.w,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 15.w,
                          height: 15.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.red,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '3',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color:
                                        AppColors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 3.heightPercent(context)),
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) =>
                    current is GetLoggedUserDataSuccess ||
                    current is GetLoggedUserDataError ||
                    current is GetLoggedUserDataLoading,
                builder: (context, state) {
                  switch (state) {
                    case GetLoggedUserDataLoading():
                      return const Center(
                        child:
                            CircularProgressIndicator(),
                      );
                    case GetLoggedUserDataError():
                      return Center(
                        child: Text(state.message),
                      );
                    case GetLoggedUserDataSuccess():
                      return Column(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 44.r,
                                backgroundColor:
                                    AppColors.grey,
                                backgroundImage:
                                    NetworkImage(
                                      state.user.photo ??
                                          Assets
                                              .icons
                                              .profileIcon
                                              .path,
                                    ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                children: [
                                  Text(
                                    state
                                            .user
                                            .firstName ??
                                        '',
                                    style:
                                        Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.pushNamed(
                                        AppRoutes
                                            .editProfile,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                state.user.email ?? '',
                                style: Theme.of(
                                  context,
                                ).textTheme.titleMedium,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 1.5.heightPercent(
                              context,
                            ),
                          ),
                          ListTileHeader(),
                          SizedBox(
                            height: 1.5.heightPercent(
                              context,
                            ),
                          ),
                          Text(
                            context.l10n.appVersion,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium,
                          ),
                        ],
                      );
                    case ProfileInitial():
                      // TODO: Handle this case.
                      throw UnimplementedError();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
