import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/user_notifications_view.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'widgets/custom_bottle_progress_report.dart';
import 'widgets/custom_home_recent_activities.dart';
import 'widgets/custom_home_slider.dart';
import '../../../../../common/widgets/custom_notification_view.dart';
import 'widgets/custom_user_home_section_header.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    //
    return Scaffold(
      appBar: AppBar(
        leading:
            // userController.user.value.profilePicture != null
            //     ? CustomImageWidget(
            //         profileImage: userController.user.value.profilePicture!,
            //         isNetWorkImage: true,
            //       )
            //     :
            const CircleAvatar(
          radius: 40,
          backgroundColor: CColors.mainColor,
          child: CircleAvatar(
            backgroundImage: AssetImage(CImages.adminProfile),
            radius: 35,
          ),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${userController.user.value.firstName ?? userController.currentUserFromLocal['firstName']}',
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
            onTap: () => Get.to(() => const UserNotificationsView()),
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

            //
            CustomHomeSectionHeader(
              title: CTexts.recentAct,
              onPressed: () => Get.to(() => const UserNotificationsView()),
            ),

            const SizedBox(height: CSizes.md),

            const CustomHomeRecentActivities()
          ],
        ),
      ),
    );
  }
}
