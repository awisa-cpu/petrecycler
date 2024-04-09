import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? action;
  final IconData icon;
  final double? size;
  final Color? iconColor;
  const CustomIconButton({
    super.key,
    this.action,
    required this.icon,
    this.iconColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        enableFeedback: false,
        onPressed: action,
        icon: Icon(
          icon,
          color: iconColor,
          size: size,
        ));
  }
}
