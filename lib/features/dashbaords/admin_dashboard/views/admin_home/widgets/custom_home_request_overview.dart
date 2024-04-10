import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

import 'custom_overview_widget.dart';

class CustomHomeRequestOverview extends StatelessWidget {
  const CustomHomeRequestOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomOverviewWidget(
              backgroundColor: CColors.warning,
              icon: Icons.dashboard_outlined,
              title: 'Total Requests',
              count: '250',
            ),
            CustomOverviewWidget(
              backgroundColor: CColors.success,
              icon: Icons.check_circle,
              title: 'Completed Requests',
              count: '110',
            ),
          ],
        ),
        SizedBox(height: CSizes.md - 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomOverviewWidget(
              backgroundColor: CColors.mainColor,
              icon: Icons.pending_actions,
              title: 'Pending Requests',
              count: '50',
            ),
            CustomOverviewWidget(
              backgroundColor: CColors.error,
              icon: Icons.toc_rounded,
              title: 'Declined Requests',
              count: '10',
            ),
          ],
        ),
      ],
    );
  }
}
