import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomProfilePage extends StatelessWidget {
  const CustomProfilePage({
    super.key,
    required this.userEmail,
    required this.onPressed,
    required this.profileImage,
  });
  final String userEmail;
  final VoidCallback onPressed;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: CColors.mainColor,
              child: CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 35,
              ),
            ),
            const SizedBox(height: CSizes.sm),
            Text(userEmail),
            TextButton(
                onPressed: onPressed,
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
