import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/features/autentication/controllers/onboarding_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    //
    return Positioned(
      right: CSizes.defaultSpace,
      bottom: CDeviceUtility.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: controller.nextPage,
        style: ElevatedButton.styleFrom(
          enableFeedback: false,
          shape: const CircleBorder(),
          backgroundColor: CColors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
