import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';

class CustomAdminNotificationIcon extends StatelessWidget {
  const CustomAdminNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNotificationsController());

    //
    return Stack(children: [
      const Icon(
        Icons.notifications_active_outlined,
        size: 35,
      ),
      Positioned(
        right: 1,
        top: 0,
        child: Obx(
          () => CustomRoundedContainer(
            backgroundColor:
                controller.unreadPendingRequestNotifications.value != 0
                    ? Colors.red
                    : Colors.green,
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: Text(
              //the notification count should show here
              controller.pendingRequests.length.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.white),
            ),
          ),
        ),
      )
    ]);
  }
}
