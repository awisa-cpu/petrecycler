import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class CustomRequestTitleWithIcon extends StatelessWidget {
  const CustomRequestTitleWithIcon({
    super.key, required this.icon, this.iconColor, required this.title,  this.height=30,  this.width=30, this.backgroundColor,
  });
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRoundedContainer(
          height: height,
          width: width,
          backgroundColor: backgroundColor?? CColors.mainColor,
          child: Icon(
           icon,
            color: iconColor?? CColors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
         title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
