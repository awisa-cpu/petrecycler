import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class ReAuthenticateLoginForm extends StatelessWidget {
  const ReAuthenticateLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
        centerTitle: true,
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            children: [
              //email
              TextFormField(
                controller: controller.verifyEmailCon,
                validator: CValidators.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: CTexts.email,
                ),
              ),

              const SizedBox(height: CSizes.lg),
              //password
              Obx(
                () => TextFormField(
                  controller: controller.verifyPasswordCon,
                  validator: (value) =>
                      CValidators.validateEmptyText(CTexts.password, value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: CTexts.password,
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                    ),
                  ),
                ),
              ),

              //
              const SizedBox(height: CSizes.lg),

              //
              CustomEButton(
                onPressed: () => controller.reAuthenticateEmailAndPassword(),
                text: CTexts.verify,
                addIcon: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
