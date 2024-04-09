import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/features/autentication/controllers/verify_email_controller.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/helper/helper_functions.dart';

import '../../../../common/widgets/buttons/custom_text_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  ///the close icon button is used to log out the user and redirect to the login screen
  ///this approach is taken to handle scenarios where the user enters the registration process
  ///and the data is stored. upon reponing the app, the state of the user is checked if email is verified or not
  ///if not verified, the user is navigated to the verification screen

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>
                Get.offAll(() => AuthRepository.instance.signOutUser()),
            icon: const Icon(CupertinoIcons.clear),
            enableFeedback: false,
          )
        ],
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          children: [
            //image
            Image(
              image: const AssetImage(CImages.deliveredEmailIllustration),
              width: CHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: CSizes.spaceBtwSections),

            //title and subtitle
            Text(
              CTexts.confirmEmail,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            Text(
              email ?? '',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            Text(
              CTexts.confirmEmailSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: CSizes.spaceBtwSections),

            //buttons
            CustomEButton(
              onPressed: () => Get.to(
                () => controller.checkEmailVerificationStatus(),
              ),
              text: CTexts.continu,
              addIcon: false,
            ),

            //
            const SizedBox(height: CSizes.spaceBtwItems),

            CustomTextButton(
              onPressed: controller.sendEmailVerification,
              text: CTexts.resendEmail,
            )
          ],
        ),
      ),
    );
  }
}
