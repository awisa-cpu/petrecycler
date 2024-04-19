import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class AdminCompanyData extends StatelessWidget {
  const AdminCompanyData({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final user = userController.admin.value;

    //
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              'Company Name',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: user.companyName,
              ),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Company Contact Person',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(hintText: user.contactPersonName),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'RCC No.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(hintText: user.rcn),
            ),
          ],
        ),
      ),
    );
  }
}
