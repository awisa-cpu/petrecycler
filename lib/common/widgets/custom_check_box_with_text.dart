import 'package:flutter/material.dart';

class CustomCheckBoxWithText extends StatelessWidget {
  const CustomCheckBoxWithText({
    super.key,
    required this.value,
    required this.onValueChange,
    required this.text,
  });
  final bool value;
  final ValueSetter<bool?> onValueChange;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
       SizedBox(
            height: 10,
            width: 21,
            child: Checkbox(
              value: value,
              onChanged: onValueChange,
            ),
          ),
     

        const SizedBox(width: 5),

        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
