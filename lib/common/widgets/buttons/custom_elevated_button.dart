import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomEButton extends StatelessWidget {
  const CustomEButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.addIcon,
    this.icon,
  });
  final VoidCallback onPressed;
  final String text;
  final bool addIcon;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: addIcon
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(text),
                  const SizedBox(
                    width: CSizes.sm,
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                  )
                ],
              )
            : Text(
                text,
              ),
      ),
    );
  }
}
