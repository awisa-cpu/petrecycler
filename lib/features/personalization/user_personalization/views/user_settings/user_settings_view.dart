import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/settings_controller.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

import '../../../../../common/widgets/buttons/custom_out_lined_button.dart';
import '../../../../../common/widgets/custom_page_center_title.dart';
import 'widgets/custom_settings_option.dart';
import 'widgets/custom_user_profile_page.dart';

class UserSettingsView extends StatelessWidget {
  const UserSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final userSettingsController = Get.put(UserSettingsController());

    //
    return Scaffold(
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomPageCenterTitle(
              title: 'Settings',
            ),

            const SizedBox(height: CSizes.lg),
            //section 1: user profile

            CustomProfilePage(
              userEmail: 'destinyawisa@gmail.com',
              onPressed: () {},
              profileImage: CImages.userProfile,
            ),

            const SizedBox(height: CSizes.md),

            //section 2: general settings
            Text('General', style: Theme.of(context).textTheme.bodyLarge),

            const SizedBox(height: CSizes.md),

            ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userSettingsController.generalSettings.length,
                itemBuilder: (_, index) {
                  final settings =
                      userSettingsController.generalSettings[index];
                  return CustomSettingsOption(
                    text: settings.title,
                    icon: settings.icon,
                    onPressed: settings.action,
                  );
                }),

            const SizedBox(height: CSizes.lg),

            //section 3: support
            Text('Support', style: Theme.of(context).textTheme.bodyLarge),

            const SizedBox(height: CSizes.md),

            ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userSettingsController.supportSettings.length,
                itemBuilder: (_, index) {
                  final reportSettings =
                      userSettingsController.supportSettings[index];

                  return CustomSettingsOption(
                    text: reportSettings.title,
                    icon: reportSettings.icon,
                    onPressed: reportSettings.action,
                  );
                }),
            const SizedBox(height: CSizes.lg + 5),

            //section 4: logout
            CustomOutLinedButton(
              text: 'Logout',
              onPressed: controller.logoutUser,
            )
          ],
        ),
      ),
    );
  }
}
