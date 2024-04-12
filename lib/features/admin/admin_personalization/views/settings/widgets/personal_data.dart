import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              'First name',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Destiny',
              ),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Awisa',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              decoration: const InputDecoration(hintText: '************'),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Phone number',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              decoration: const InputDecoration(hintText: '08128824153'),
            ),
          ],
        ),
      ),
    );
  }
}
