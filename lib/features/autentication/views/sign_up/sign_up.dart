import 'package:flutter/material.dart';
import '../../../../common/styles/custom_layout_with_scroll_padding.dart';
import 'widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Sign up'),
      ),
      body: const CustomLayoutWithScrollAndPadding(
        child: Column(
          children: [
            //sign up text
            Text('Fill the form to create account'),

            SizedBox(height: 15),

            //form
            SignUpForm()

            //social media buttons
          ],
        ),
      ),
    );
  }
}
