import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import '../../../../common/styles/custom_layout_with_scroll_padding.dart';
import 'widgets/sign_up_form.dart';

class SignUpUserView extends StatelessWidget {
  const SignUpUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(CTexts.signUp),
      ),
      body: const CustomLayoutWithScrollAndPadding(
        child: Column(
          children: [
            //sign up text
            Text(CTexts.createUserAccount),

            SizedBox(height: 15),

            //form
            SignUpForm(
              userTypeAdmin: false,
            )

            //social media buttons
          ],
        ),
      ),
    );
  }
}
