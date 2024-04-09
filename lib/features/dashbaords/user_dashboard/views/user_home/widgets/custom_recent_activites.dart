import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/features/dashbaords/user_dashboard/views/user_home/widgets/custom_activity.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomRecentActivites extends StatelessWidget {
  const CustomRecentActivites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      elevation: 1.5,
      padding: const EdgeInsets.all(CSizes.md),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (_, index) => const CustomActivity(),
      ),
    );
  }
}
