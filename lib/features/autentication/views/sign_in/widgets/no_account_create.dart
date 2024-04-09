import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class NoAccountCreate extends StatelessWidget {
  const NoAccountCreate({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
  });
  final String firstText;
  final String secondText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: Colors.grey,
              ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(secondText,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: CColors.mainColor)),
        )
      ],
    );
  }
}
