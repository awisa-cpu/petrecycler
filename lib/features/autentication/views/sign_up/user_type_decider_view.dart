import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/custom_check_box_with_text.dart';
import 'package:petrecycler/common/widgets/custom_e_button.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

class UserTypeDeciderView extends StatelessWidget {
  const UserTypeDeciderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignInController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 140),

            Text(
              CTexts.registerAsUserOrAdmin,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: CSizes.lg),

            //
            Obx(
              () => CustomCheckBoxWithText(
                  value: controller.showUser.value,
                  onValueChange: controller.onShowUser,
                  text: CTexts.showUserView),
            ),

            const SizedBox(height: CSizes.lg),

            Obx(
              () => CustomCheckBoxWithText(
                  value: controller.showAdmin.value,
                  onValueChange: controller.onShowAdmin,
                  text: CTexts.showAdminView),
            ),

            const SizedBox(height: CSizes.lg + 15),

            CustomEButton(
              onPressed: controller.continueUserRegistration,
              text: CTexts.continueWithRegistration,
            ),
          ],
        ),
      ),
    );
  }
}
