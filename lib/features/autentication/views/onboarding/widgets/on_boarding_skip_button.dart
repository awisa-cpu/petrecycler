import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/buttons/custom_text_button.dart';
import 'package:petrecycler/features/autentication/controllers/onboarding_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    final controller = OnBoardingController.instance;

    //
    return Positioned(
      top: CDeviceUtility.getAppBarHeight(),
      right: CSizes.defaultSpace,
      child: CustomTextButton(
        onPressed: controller.skipPage,
        text: 'Skip',
      ),
    );
  }
}
