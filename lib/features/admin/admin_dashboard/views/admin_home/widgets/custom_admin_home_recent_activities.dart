import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_activity.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/formatters/input_formatters.dart';

class CustomAdminHomeRecentActivities extends StatelessWidget {
  const CustomAdminHomeRecentActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNotificationsController());

    //
    return CustomRoundedContainer(
      elevation: 1.5,
      padding: const EdgeInsets.all(CSizes.md),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.pendingRequests.length <= 3
              ? controller.pendingRequests.length
              : 3,
          itemBuilder: (_, index) {
            final style = Theme.of(context).textTheme.bodyMedium;
            final recentRequest = controller.pendingRequests[index];
            return Column(
              children: [
                CustomActivity(
                  leading: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        recentRequest.status,
                        style: style,
                      ),
                      const CustomRoundedContainer(
                        backgroundColor: Colors.red,
                        width: 15,
                        height: 15,
                        radius: 40,
                      ),
                    ],
                  ),
                  title: recentRequest.address,
                  subTitle: recentRequest.phoneNumber,
                  trailing: Text(
                    CFormatters.formatDate(recentRequest.createdAt),
                    style: style,
                  ),
                ),
                const Divider()
              ],
            );
          }),
    );
  }
}
