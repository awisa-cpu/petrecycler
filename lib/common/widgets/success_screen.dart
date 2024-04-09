import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

class CustomSuccessScreen extends StatelessWidget {
  const CustomSuccessScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.onPressed});
  final String imageUrl, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: CSizes.spaceBtwSections - 2,
            bottom: CSizes.defaultSpace,
            right: CSizes.defaultSpace,
            left: CSizes.defaultSpace,
          ),
          child: Column(
            children: [
              //image
              Lottie.asset(imageUrl,
                  width: MediaQuery.of(context).size.width * 0.6),

              const SizedBox(height: CSizes.spaceBtwSections),

              //title and subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),

              //
              CustomEButton(
                addIcon: false,
                onPressed: onPressed,
                text: CTexts.continu,
              )
            ],
          ),
        ),
      ),
    );
  }
}
