import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

import 'widgets/password_reset_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key, required this.text, this.actionText});
  final String text;
  final String? actionText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          children: [
            //
            Text(
              'Fill in your new password',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: CSizes.lg),

            //
            PasswordResetForm(
              actionText: actionText,
            ),
          ],
        ),
      ),
    );
  }
}
