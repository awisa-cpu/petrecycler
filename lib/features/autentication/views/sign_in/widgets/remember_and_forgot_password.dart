import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';
import 'package:petrecycler/features/autentication/views/sign_in/forgot_password.dart';

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
        Row(
          children: [
            //
            Obx(
              () => SizedBox(
                height: 10,
                width: 21,
                child: Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: controller.onRememberMeChanged,
                ),
              ),
            ),

            const SizedBox(width: 5),

            Text(
              'Remember me',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
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
