import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

import 'custom_overview_widget.dart';

class CustomHomeRequestOverview extends StatelessWidget {
  const CustomHomeRequestOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNotificationsController());

    //
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomOverviewWidget(
                backgroundColor: CColors.mainColor,
                icon: Icons.pending_actions,
                title: 'Pending Requests',
                count: controller.pendingRequests.length.toString(),
              ),
              CustomOverviewWidget(
                backgroundColor: CColors.error,
                icon: Icons.toc_rounded,
                title: 'Declined Requests',
                count: controller.declinedRequests.length.toString(),
              ),
            ],
          ),
          const SizedBox(height: CSizes.md - 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomOverviewWidget(
                backgroundColor: CColors.warning,
                icon: Icons.dashboard_outlined,
                title: 'Accepted Requests',
                count: controller.acceptedRequests.length.toString(),
              ),
              CustomOverviewWidget(
                backgroundColor: CColors.success,
                icon: Icons.check_circle,
                title: 'Completed Requests',
                count: controller.completedRequests.length.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
