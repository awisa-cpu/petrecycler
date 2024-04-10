import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomRecentActivites extends StatelessWidget {
  const CustomRecentActivites({
    super.key,
    required this.itemCount,
    required this.builder,
  });
  final int itemCount;
  final Widget builder;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      elevation: 1.5,
      padding: const EdgeInsets.all(CSizes.md),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: (_, index) => builder),
    );
  }
}
