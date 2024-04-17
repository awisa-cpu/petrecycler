import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_icon_button.dart';
import 'package:petrecycler/common/widgets/buttons/custom_text_button.dart';
import 'package:petrecycler/features/user/user_notifications_management/controllers/user_notifications_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class UserNotificationsView extends StatelessWidget {
  const UserNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserNotificationsController());

    //
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: Icons.chevron_left,
          action: () => Get.back(),
        ),
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          CustomTextButton(
            text: 'Mark all as read',
            onPressed: () => controller.markAllAsRead(),
            textColor: Colors.white,
          )
        ],
      ),
      body: Obx(
        () => CustomLayoutWithScrollAndPadding(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.notifications.length,
              itemBuilder: (_, index) {
                final notification = controller.notifications[index];
                final iconColor =
                    notification.readStatus ? CColors.mainColor : Colors.red;

                return Column(
                  children: [
                    ListTile(
                      enableFeedback: false,
                      onTap: () {
                        // Mark the notification as read
                        controller.markAsRead(notification);
                        controller.showDialogOfNotification(notification);
                      },
                      leading: Icon(Icons.notifications, color: iconColor),
                      title:
                          Text(notification.message.notification?.title ?? ''),
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
