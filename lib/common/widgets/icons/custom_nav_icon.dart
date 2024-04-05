import 'package:flutter/material.dart';

class CustomNavIcon extends StatelessWidget {
  const CustomNavIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      size: 26,
    );
  }
}
