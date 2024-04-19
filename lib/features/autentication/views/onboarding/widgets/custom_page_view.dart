import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.md),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Image.asset(
              image,
              width: CDeviceUtility.getScreenWidth(context) * 0.8,
              height: CDeviceUtility.getScreenHeight(context) * 0.6,
            ),

            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),

            //
            const SizedBox(height: CSizes.spaceBtwItems),

            //
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
