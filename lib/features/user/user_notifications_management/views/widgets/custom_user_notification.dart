import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/notification_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/widgets/custom_request_title_with_icon.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomUserNotification extends StatelessWidget {
  const CustomUserNotification({
    super.key,
    required this.notification,
  });
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(CSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRequestTitleWithIcon(
              icon: Iconsax.notification,
              title: 'Notification Details',
              height: 40,
              width: 40,
            ),
            const SizedBox(height: CSizes.sm),
            const Divider(),
            const SizedBox(height: CSizes.sm),
            Text(notification.message.notification?.title ?? ''),
            const SizedBox(height: CSizes.sm),
            Text(notification.message.notification?.body ?? ''),
            const SizedBox(height: CSizes.md),
            Text(
              'Date of Pickup',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: CSizes.sm),
            Text(notification.message.data['dop'] ?? ''),
            const SizedBox(height: CSizes.md),
            Text(
              'Time of Pickup',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: CSizes.sm),
            Text(notification.message.data['top'] ?? ''),
            const SizedBox(height: CSizes.sm),
            Text(
              'Decline Reason',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: CSizes.sm),
            Text(notification.message.data['declineReason'] ?? ''),
          ],
        ),
      ),
    );
  }
}
