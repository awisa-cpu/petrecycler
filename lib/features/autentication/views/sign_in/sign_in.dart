import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';
import 'widgets/sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(CImages.loginAuth),
              height: CDeviceUtility.getScreenHeight(context) * 0.28,
            ),
            //
            Text(
              'Enter details to sign into your account',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 15),
            //
            const SignInForm()
          ],
        ),
      ),
    );
  }
}
