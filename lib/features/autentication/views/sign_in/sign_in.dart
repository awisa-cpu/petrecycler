import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'widgets/sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Sign in'),
      ),
      body: const CustomLayoutWithScrollAndPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Text('Enter details to sign into your account'),

            SizedBox(height: 15),
            //
            SignInForm()
          ],
        ),
      ),
    );
  }
}
