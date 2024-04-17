import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/user_notifications_view.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

class CustomUserHomeSectionHeader extends StatelessWidget {
  const CustomUserHomeSectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          CTexts.recentAct,
          style: Theme.of(context).textTheme.titleLarge,
        ),
    
        //
        GestureDetector(
          onTap: () => Get.to(() => const UserNotificationsView()),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View More',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: CSizes.sm - 2),
              const Icon(
                Icons.arrow_forward_rounded,
              )
            ],
          ),
        ),
      ],
    );
  }
}
