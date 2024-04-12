import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          enableFeedback: false,
          backgroundColor:
              MaterialStatePropertyAll(backgroundColor ?? CColors.mainColor)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
