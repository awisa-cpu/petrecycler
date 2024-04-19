import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomHomeSectionHeader extends StatelessWidget {
  const CustomHomeSectionHeader({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),

        //
        GestureDetector(
          onTap: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View More',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: CSizes.sm - 2),
              const Icon(
                Icons.arrow_forward_rounded,
              )
            ],
          ),
        ),
      ],
    );
  }
}
