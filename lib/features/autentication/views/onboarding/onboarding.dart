import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/autentication/controllers/onboading_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Onboarding Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            const Text('This is the onboarding screen'),

            ElevatedButton(
              onPressed: controller.toLogin,
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}
