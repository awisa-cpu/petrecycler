import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/features/user/user_personalization/views/user_settings/re_authenticate_user_login_form.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class AdminAccountData extends StatelessWidget {
  const AdminAccountData({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final user = userController.admin.value;
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              'Email address',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: user.email,
              ),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Contact No.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: user.phoneNumber,
              ),
            ),

            const SizedBox(height: CSizes.lg),
            Text(
              'Delete Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Your account will be permanently removed from the application. All your data will be lost',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: CSizes.lg),

            CustomEButton(
              onPressed: () => Get.to(() => const ReAuthenticateLoginForm()),
              text: 'Delete Account',
              addIcon: false,
            )
          ],
        ),
      ),
    );
  }
}
