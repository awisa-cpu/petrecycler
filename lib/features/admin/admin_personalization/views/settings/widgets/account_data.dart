import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/account_info_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class AccountData extends StatelessWidget {
  const AccountData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountInfoController());
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
              decoration: const InputDecoration(
                hintText: 'destinyawisa@gmail.com',
              ),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Password',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            Obx(
              () => TextFormField(
                decoration: InputDecoration(
                  hintText: '************',
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
              'Delete Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Your account will be permanently removed from the application. All your data will be lost',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: CSizes.lg),

            CustomEButton(
              onPressed: () {},
              text: 'Delete Account',
              addIcon: false,
            )
          ],
        ),
      ),
    );
  }
}
