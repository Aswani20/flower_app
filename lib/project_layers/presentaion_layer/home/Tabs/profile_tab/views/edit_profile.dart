import 'package:flower_app/core/extensions/navigator_extensions.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/utils/widgets/app_text_form_feild.dart';
import 'package:flower_app/core/utils/widgets/custom_button.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.editProfile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 44.r,
                    backgroundColor: AppColors.grey,
                    backgroundImage: AssetImage(
                      Assets.icons.profileIcon.path,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius:
                            BorderRadius.circular(8),
                      ),

                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.camera_alt_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 3.heightPercent(context)),
            Row(
              children: [
                Expanded(
                  child: AppTextFormFeild(
                    hintText: context.l10n.firstName,
                    validator: (value) {},
                  ),
                ),
                SizedBox(width: 2.widthPercent(context)),
                Expanded(
                  child: AppTextFormFeild(
                    hintText: context.l10n.lastName,
                    validator: (value) {},
                  ),
                ),
              ],
            ),

            SizedBox(height: 1.heightPercent(context)),
            AppTextFormFeild(
              hintText: context.l10n.email,
              validator: (value) {},
            ),
            SizedBox(height: 1.heightPercent(context)),
            AppTextFormFeild(
              hintText: context.l10n.phoneNumber,
              validator: (value) {},
            ),
            SizedBox(height: 1.heightPercent(context)),
            AppTextFormFeild(
              suffixIcon: TextButton(
                onPressed: () {
                  context.pushNamed(
                    AppRoutes.resetPassword,
                  );
                },
                child: Text('Change'),
              ),
              hintText: context.l10n.passwordHint,
              validator: (value) {},
            ),
            SizedBox(height: 1.5.heightPercent(context)),
            CustomButton(
              size: Size(double.infinity, 48.h),
              borderRadius: 25.r,
              child: Text('update'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
