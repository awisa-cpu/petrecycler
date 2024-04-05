import 'package:flutter/material.dart';

class CustomEButton extends StatelessWidget {
  const CustomEButton({
    super.key, required this.onPressed, required this.text,
  });
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
