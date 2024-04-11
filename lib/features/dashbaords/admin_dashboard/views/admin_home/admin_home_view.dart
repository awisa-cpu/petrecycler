import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/custom_notification_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/shimmers/custom_shimmer_effect.dart';

import 'widgets/custom_admin_home_recent_activity.dart';
import 'widgets/custom_home_request_bar_data.dart';
import 'widgets/custom_home_request_overview.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.light,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                userController.isProfileNameLoading.value
                    ? const CustomShimmerEffect(width: 90, height: 15)
                    : Text(
                        'Welcome back, ${userController.user.value.contactPersonName}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                const Icon(
                  Icons.handshake,
                  color: Colors.yellow,
                )
              ],
            ),
          ],
        ),
        actions: const [CustomNotificationIcon()],
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //section 1: Request summary
            Text(
              'Requests Overview',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: CSizes.md),

            const CustomHomeRequestOverview(),

            //section 2: Request overview: charts
            const SizedBox(height: CSizes.lg),

            const CustomHomeRequestBarData(),

            //section 3: Recent Activity
            const SizedBox(height: CSizes.lg),

            Text(
              'Recent Requests',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: CSizes.md),

            const CustomAdminHomeRecentActivity()
          ],
        ),
      ),
    );
  }
}
