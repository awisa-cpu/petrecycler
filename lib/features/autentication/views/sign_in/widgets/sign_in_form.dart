import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_e_button.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/features/autentication/views/sign_up/sign_up.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';

import 'no_account_create.dart';
import 'remember_and_forgot_password.dart';
import 'social_media_button.dart';
import 'vertical_sign_in_divider.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    //
    return Form(
      key: controller.signInFormKey,
      child: Column(
        children: [
          //email
          TextFormField(
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: CTexts.email,
              prefixIcon: Icon(Icons.email_outlined),
            ),
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: CSizes.md),

          //password
          Obx(
            () => TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                labelText: CTexts.password,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: IconButton(
                  enableFeedback: false,
                  onPressed: controller.shouldShowPassword,
                  icon: Icon(
                    controller.showPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: controller.showPassword.value,
            ),
          ),

          const SizedBox(height: CSizes.md - 3),

          const RememberAndForgotPassword(),

          const SizedBox(height: CSizes.md - 3),

          CustomEButton(onPressed: controller.loginUser, text: CTexts.signIn),

          const SizedBox(height: CSizes.md),

          const VerticalSignInDivider(),

          const SizedBox(height: CSizes.md),

          SocialMediaButton(
            text: CTexts.continuWithGoogle,
            imageUrl: CImages.google,
            onPressed: () {},
          ),

          const SizedBox(height: CSizes.md),

          NoAccountCreate(
            firstText: CTexts.noAccount,
            secondText: CTexts.createAccount,
            onPressed: () => Get.to(
              () => const SignUpView(),
            ),
          ),
        ],
      ),
    );
  }
}
