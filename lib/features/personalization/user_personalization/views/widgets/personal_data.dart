import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    //
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              CTexts.firstName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              initialValue: userController.user.value.firstName,
              readOnly: true,
              decoration: const InputDecoration(),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              CTexts.surName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              initialValue: userController.user.value.surName,
              readOnly: true,
              decoration: const InputDecoration(),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              CTexts.phoneNo,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              initialValue: userController.user.value.phoneNumber,
              readOnly: true,
              decoration: const InputDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
