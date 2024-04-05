import 'package:flutter/material.dart';

class VerticalSignInDivider extends StatelessWidget {
  const VerticalSignInDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 10),
        Text('Or'),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
