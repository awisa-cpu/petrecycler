import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/dashbaords/user_dashboard/views/notification_view.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'widgets/custom_bottle_progress_report.dart';
import 'widgets/custom_home_slider.dart';
import 'widgets/custom_recent_activites.dart';
import 'widgets/custom_notification_view.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(CImages.userProfile),
            radius: 25,
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Lawrence!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Let's contribute to our earth",
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
              const SizedBox(height: CSizes.sm),

              //section 1: Information
              Text(
                "Let's Recycle",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Working Together To Clean Our Environment",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: CSizes.md + 5),

              //section 2: sliders
              Text(
                'Your Mission',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: CSizes.md),

              const CustomHomeSlider(),

              //section 3: progress report
              const SizedBox(height: CSizes.lg),
              Text(
                'Progress',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: CSizes.md),

              const CustomBottleProgressReport(),

              ///section 4: recent activities
              const SizedBox(height: CSizes.lg),
              Text(
                'Recent Activities',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: CSizes.md),

              const CustomRecentActivites()
            ],
          ),
        ),
      ),
    );
  }
}
