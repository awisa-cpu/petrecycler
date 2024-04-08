import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/features/autentication/views/sign_in/forgot_password.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

import '../../../../../common/widgets/custom_check_box_with_text.dart';

class RememberAndForgotPassword extends StatelessWidget {
  const RememberAndForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignInController.instance;

    //
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //remember me
        Obx(
          () => CustomCheckBoxWithText(
            value: controller.rememberMe.value,
            onValueChange: controller.onRememberMeChanged,
            text: CTexts.rememberMe,
          ),
        ),

        //forgot password
        TextButton(
          style: const ButtonStyle(enableFeedback: false),
          onPressed: () => Get.to(() => const ForgotPasswordView()),
          child: Text(
            'Forgot Password?',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.blue[300]),
          ),
        )
      ],
    );
  }
}
