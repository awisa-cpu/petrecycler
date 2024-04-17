import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/features/user/user_notifications_management/controllers/user_notifications_controller.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserNotificationsController());

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
              backgroundColor: controller.unreadNotificationCount.value != 0
                  ? Colors.red
                  : Colors.green,
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  controller.unreadNotificationCount.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.white),
                ),
              ),
            ),
          ))
    ]);
  }
}
