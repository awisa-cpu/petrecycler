import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';
import '../../../../common/styles/custom_layout_with_scroll_padding.dart';
import 'widgets/sign_up_form.dart';

class SignUpUserView extends StatelessWidget {
  const SignUpUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(CTexts.signUp),
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          children: [
            Image(
              image: const AssetImage(CImages.signUpAuth),
              height: CDeviceUtility.getScreenHeight(context) * 0.28,
            ),

            //sign up text
            Text(
              CTexts.createUserAccount,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: CSizes.md),

            //form
            const SignUpForm(
              userTypeAdmin: false,
            )
          ],
        ),
      ),
    );
  }
}
