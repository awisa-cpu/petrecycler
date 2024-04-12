import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/autentication/controllers/onboarding_controller.dart';
import 'package:petrecycler/features/autentication/views/onboarding/widgets/on_boarding_dot_navigation.dart';
import 'package:petrecycler/features/autentication/views/onboarding/widgets/on_boarding_next_button.dart';
import 'package:petrecycler/features/autentication/views/onboarding/widgets/on_boarding_skip_button.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';

import 'widgets/custom_page_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    //
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              CustomPageView(
                image: CImages.signUpAuth,
                title: 'Working together to keep our environment clean',
                subTitle:
                    'Knowing the necessity of our goals is very good, let  us work together',
              ),
              CustomPageView(
                image: CImages.loginAuth,
                title: 'Working together to keep our environment clean',
                subTitle:
                    'Knowing the necessity of our goals is very good, let  us work together',
              ),
              CustomPageView(
                image: CImages.signAsWho,
                title: 'Working together to keep our environment clean',
                subTitle:
                    'Knowing the necessity of our goals is very good, let  us work together',
              ),
            ],
          ),

          //skip button
          const OnBoardingSkipButton(),

          //Dot Navigation smoothPage indicator
          const OnBoardingDotNavigation(),

          //circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
