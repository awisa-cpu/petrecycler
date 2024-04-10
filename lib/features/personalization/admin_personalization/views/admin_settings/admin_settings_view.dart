import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_out_lined_button.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/features/personalization/admin_personalization/controllers/admin_settings_controller.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/user_settings/widgets/custom_settings_option.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/user_settings/widgets/custom_user_profile_page.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class AdminSettingsView extends StatelessWidget {
  const AdminSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final adminSettingsController = Get.put(AdminSettingsController());

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Settings'),
        centerTitle: true,
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //section 1: profile
            CustomProfilePage(
              userEmail: 'dandgawisa@gmail.com',
              onPressed: () {},
              profileImage: CImages.adminProfile,
            ),

            const SizedBox(height: CSizes.md),

            //section 2: general settings
            Text('General', style: Theme.of(context).textTheme.bodyLarge),

            const SizedBox(height: CSizes.md),

            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: adminSettingsController.generalSettings.length,
              itemBuilder: (_, index) {
                final settings = adminSettingsController.generalSettings[index];
                return CustomSettingsOption(
                  text: settings.title,
                  icon: settings.icon,
                  onPressed: settings.action,
                );
              },
            ),

            const SizedBox(height: CSizes.lg),

            //section 3: logout
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
