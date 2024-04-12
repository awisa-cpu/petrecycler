import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_out_lined_button.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/features/admin/admin_personalization/views/settings/admin_account_info_view.dart';
import 'package:petrecycler/features/admin/admin_personalization/views/settings/admin_address_info_view.dart';
import 'package:petrecycler/features/admin/admin_personalization/views/settings/admin_issues_help_view.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/features/user/user_personalization/views/user_settings/widgets/custom_settings_option.dart';
import 'package:petrecycler/features/user/user_personalization/views/user_settings/widgets/custom_user_profile_page.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class AdminSettingsView extends StatelessWidget {
  const AdminSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final userController = UserController.instance;

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
              userEmail: userController.user.value.email,
              onPressed: userController.uploadUserProfilePicture,
              profileImage: userController.user.value.profilePicture,
            ),

            const SizedBox(height: CSizes.md),

            //section 2: general settings
            Text('General', style: Theme.of(context).textTheme.bodyLarge),

            const SizedBox(height: CSizes.md),

            CustomSettingsOption(
              text: 'Account Information',
              icon: Icons.person,
              onPressed: () => Get.to(
                () => const AdminAccountInformationView(),
              ),
            ),

            CustomSettingsOption(
              text: 'Address Information',
              icon: Iconsax.location,
              onPressed: () => Get.to(
                () => const AdminAddressInformationView(),
              ),
            ),

            CustomSettingsOption(
              text: 'Help Center',
              icon: Iconsax.location,
              onPressed: () => Get.to(() => const AdminIssuesHelpView()),
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
