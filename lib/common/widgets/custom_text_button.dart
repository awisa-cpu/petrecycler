import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text, required this.onPressed,
  
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(enableFeedback: false),
      
      onPressed: onPressed, child:  Text(text),);
  }
}
