import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/dashbaords/user_dashboard/views/notification_view.dart';
import 'package:petrecycler/common/widgets/custom_activity.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/shimmers/custom_shimmer_effect.dart';
import '../../../../../common/widgets/custom_image_widget.dart';
import 'widgets/custom_bottle_progress_report.dart';
import 'widgets/custom_home_slider.dart';
import '../../../../../common/widgets/custom_recent_activites.dart';
import '../../../../../common/widgets/custom_notification_view.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    //
    return Scaffold(
      appBar: AppBar(
        leading: CustomImageWidget(
          profileImage: userController.user.value.profilePicture,
          isNetWorkImage: true,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userController.isProfileNameLoading.value
                ? const CustomShimmerEffect(width: 80, height: 15)
                : Text(
                    'Hi, ${userController.user.value.firstName}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
            Text(
              CTexts.letsContribute,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const NotificationView()),
            child: const CustomNotificationIcon(),
          )
        ],
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //section 1: Information
            Text(
              CTexts.letsRecycle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              CTexts.workingTogether,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            const SizedBox(height: CSizes.md + 5),

            //section 2: sliders
            Text(
              CTexts.ourMission,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: CSizes.md),

            const CustomHomeSlider(),

            //section 3: progress report
            const SizedBox(height: CSizes.lg),
            Text(
              CTexts.progress,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: CSizes.md),

            const CustomBottleProgressReport(),

            ///section 4: recent activities
            const SizedBox(height: CSizes.lg),
            Text(
              CTexts.recentAct,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: CSizes.md),

            const CustomRecentActivites(
              itemCount: 4,
              builder: CustomActivity(
                title: 'Request completed',
                subTitle: 'Pickup date set',
              ),
            )
          ],
        ),
      ),
    );
  }
}
