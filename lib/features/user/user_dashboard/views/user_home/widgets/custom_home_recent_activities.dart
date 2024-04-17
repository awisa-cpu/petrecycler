import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_activity.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/features/user/user_notifications_management/controllers/user_notifications_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomHomeRecentActivities extends StatelessWidget {
  const CustomHomeRecentActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notificationsController = Get.put(UserNotificationsController());

    //
    return Obx(
      () => CustomRoundedContainer(
        elevation: 1.5,
        padding: const EdgeInsets.all(CSizes.md),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: notificationsController.notifications.length <= 3
              ? notificationsController.notifications.length
              : 3,
          itemBuilder: (_, index) {
            final recentNotification =
                notificationsController.notifications[index];
            final iconColor =
                recentNotification.readStatus ? Colors.green : Colors.red;
            return CustomActivity(
              backgroundColor: iconColor,
              title: recentNotification.message.notification?.title ?? '',
              subTitle: recentNotification.message.notification?.body ?? '',
            );
          },
        ),
      ),
    );
  }
}
