import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomUserProfilePage extends StatelessWidget {
  const CustomUserProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(CImages.userProfile),
              radius: 35,
            ),
            const SizedBox(height: CSizes.sm),
            const Text('destinyawisa@gmail.com'),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Change Profile picture',
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: CColors.mainColor,
                      ),
                ))
          ],
        ),
      ],
    );
  }
}
