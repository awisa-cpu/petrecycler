
import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/autentication/views/sign_up/widgets/sign_up_form.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

class SignUpRecyclerView extends StatelessWidget {
  const SignUpRecyclerView({super.key});

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
            Text(CTexts.createRecyclerAccount),

            SizedBox(height: 15),

            //form
            SignUpForm(userTypeAdmin: true,)

            //social media buttons
          ],
        ),
      ),
    );
  }
}