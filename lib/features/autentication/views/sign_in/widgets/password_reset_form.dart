import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_e_button.dart';
import 'package:petrecycler/features/autentication/controllers/forgot_password_controller.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

class PasswordResetForm extends StatelessWidget {
  const PasswordResetForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Form(
      child: Column(
        children: [
          //password
          Obx(
            () => TextFormField(
              decoration: InputDecoration(
                labelText: CTexts.password,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: IconButton(
                  enableFeedback: false,
                  onPressed: controller.shouldShowPassword,
                  icon: Icon(
                    controller.showPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: controller.showPassword.value,
            ),
          ),

          const SizedBox(height: 15),

          //Confirm password
          Obx(
            () => TextFormField(
              decoration: InputDecoration(
                labelText: CTexts.confirmPassword,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: IconButton(
                  enableFeedback: false,
                  onPressed: controller.shouldShowConfirmPassword,
                  icon: Icon(
                    controller.showConfirmPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: controller.showConfirmPassword.value,
            ),
          ),

          const SizedBox(height: 13),

          CustomEButton(onPressed: () {}, text: 'Reset Password'),
        ],
      ),
    );
  }
}
