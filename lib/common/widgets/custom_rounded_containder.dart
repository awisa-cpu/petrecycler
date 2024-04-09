import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = CSizes.md,
    this.padding,
    this.child,
    this.backgroundColor = Colors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = CColors.borderPrimary,
    this.alignment,
    this.elevation,
  });
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final double? elevation;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0.0,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        alignment: alignment,
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          border: showBorder ? Border.all(color: borderColor) : null,
        ),
        child: child,
      ),
    );
  }
}
