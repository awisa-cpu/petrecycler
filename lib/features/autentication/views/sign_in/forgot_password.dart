import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';

import 'widgets/password_reset_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Reset'),
      ),
      body: const CustomLayoutWithScrollAndPadding(
        child: Column(
          children: [
            //
            Text('Fill in your new password'),

            //
            PasswordResetForm(),
          ],
        ),
      ),
    );
  }
}
