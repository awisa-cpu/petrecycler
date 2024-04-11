import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/account_info_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/address_info_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/contact_us_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/faq_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/report_issue_view.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import '../../../../../common/widgets/buttons/custom_out_lined_button.dart';
import 'widgets/custom_settings_option.dart';
import 'widgets/custom_user_profile_page.dart';

class UserSettingsView extends StatelessWidget {
  const UserSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final userController = UserController.instance;

    //
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //section 1: user profile

            CustomProfilePage(
              userEmail: userController.user.value.email,
              onPressed: userController.uploadUserProfilePicture,
              profileImage: CImages.adminProfile,
            ),

            const SizedBox(height: CSizes.md),

            //section 2: general settings
            Text('General', style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: CSizes.md),

            CustomSettingsOption(
              text: 'Account Information',
              icon: Icons.person,
              onPressed: () => Get.to(
                () => const AccountInformationView(),
              ),
            ),

            CustomSettingsOption(
              text: 'Address Information',
              icon: Icons.person,
              onPressed: () => Get.to(
                () => AddressInformationView(user: userController.user.value),
              ),
            ),

            const SizedBox(height: CSizes.lg),

            //section 3: support
            Text('Support', style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: CSizes.md),

            CustomSettingsOption(
              text: 'Report an issue',
              icon: Iconsax.notification,
              onPressed: () => Get.to(
                () => const ReportIssueView(),
              ),
            ),

            CustomSettingsOption(
              text: 'Contact Us',
              icon: Iconsax.call,
              onPressed: () => Get.to(
                () => const ContactUsView(),
              ),
            ),

            CustomSettingsOption(
              text: 'FAQ',
              icon: Iconsax.info_circle,
              onPressed: () => Get.to(
                () => const FaqView(),
              ),
            ),

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
