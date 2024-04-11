import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/autentication/controllers/forgot_password_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class PasswordResetForm extends StatelessWidget {
  const PasswordResetForm({
    super.key,
    this.actionText,
  });
  final String? actionText;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    //
    return Form(
      key: controller.passwordResetKey,
      child: Column(
        children: [
          //password
          TextFormField(
            validator: CValidators.validateEmail,
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: CTexts.emailAddess,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: CSizes.lg),

          CustomEButton(
            onPressed: controller.forgotPasswordReset,
            text: actionText ?? 'Reset Password',
            addIcon: false,
          ),
        ],
      ),
    );
  }
}
