import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_activity.dart';
import 'package:petrecycler/common/widgets/custom_recent_activites.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';

class CustomAdminHomeRecentActivity extends StatelessWidget {
  const CustomAdminHomeRecentActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    return CustomRecentActivites(
      itemCount: 6,
      builder: CustomActivity(
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pending',
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
        title: 'Amos Luke Tom ',
        subTitle: 'No. 4 Atiku',
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('58 ', style: style),
            Text(
              '12-02-24',
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
