import 'package:flutter/material.dart';
import 'package:petrecycler/features/autentication/controllers/onboarding_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: CDeviceUtility.getBottomNavigationBarHeight() + 25.0,
      left: CSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: const ExpandingDotsEffect(
          activeDotColor: CColors.dark,
          dotHeight: 6,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
