import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class CustomRequestTitleWithIcon extends StatelessWidget {
  const CustomRequestTitleWithIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomRoundedContainer(
          height: 30,
          width: 30,
          backgroundColor: CColors.mainColor,
          child: Icon(
            Icons.recycling,
            color: CColors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Pet Bottle Recycling',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
