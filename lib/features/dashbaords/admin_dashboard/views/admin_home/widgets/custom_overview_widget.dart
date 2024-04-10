import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomOverviewWidget extends StatelessWidget {
  const CustomOverviewWidget({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.count,
  });
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      elevation: 1.5,
      width: 170,
      child: Row(
        children: [
          CustomRoundedContainer(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            backgroundColor: backgroundColor,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: CSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  count,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
