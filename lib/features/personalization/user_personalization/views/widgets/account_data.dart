import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/account_info_controller.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/user_settings/re_authenticate_user_login_form.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

class AccountData extends StatelessWidget {
  const AccountData({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountInfoController());
     final userController = UserController.instance;

    //
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              CTexts.emailAddess,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              initialValue: userController.user.value.email,
              decoration: const InputDecoration(),
              readOnly: true,
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              CTexts.password,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            Obx(
              () => TextFormField(
                  initialValue: userController.user.value.email,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    enableFeedback: false,
                    onPressed: controller.passwordToggler,
                    icon: Icon(
                      controller.togglePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: controller.togglePassword.value,
              ),
            ),

            const SizedBox(height: CSizes.lg),
            Text(
              CTexts.deleteAcc,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              CTexts.yourAccountDelete,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: CSizes.lg),

            CustomEButton(
              onPressed: () => Get.to(() => const ReAuthenticateLoginForm()),
              text: CTexts.deleteAcc,
              addIcon: false,
            )
          ],
        ),
      ),
    );
  }
}
