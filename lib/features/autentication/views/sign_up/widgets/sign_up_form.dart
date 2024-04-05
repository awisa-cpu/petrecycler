import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_e_button.dart';
import 'package:petrecycler/features/autentication/controllers/sign_up_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    //
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first name
          TextFormField(
            controller: controller.firstName,
            decoration: InputDecoration(
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'First Name',
                prefixIcon: const Icon(Icons.person)),
            keyboardType: TextInputType.name,
          ),

          const SizedBox(height: 15),

          //last name
          TextFormField(
            controller: controller.lastName,
            decoration: InputDecoration(
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Last Name',
                prefixIcon: const Icon(Icons.person)),
            keyboardType: TextInputType.name,
          ),

          const SizedBox(height: 15),

          //email
          TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined)),
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 15),

          //phone number
          TextFormField(
            controller: controller.phoneNumber,
            decoration: InputDecoration(
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone)),
            keyboardType: TextInputType.name,
          ),

          const SizedBox(height: CSizes.md),

          //user type
          const Text('Select User Type'),

          const SizedBox(height: CSizes.md),

          DropdownButtonFormField<String>(
            value: controller.userType?.value,
            items: const [
              DropdownMenuItem(
                value: 'admin',
                child: Text('Admin'),
              ),
              DropdownMenuItem(
                value: 'user',
                child: Text('User'),
              )
            ],
            onChanged: (value) {
              controller.selectUserType(value);
            },
          ),

          const SizedBox(height: 15),

          //password
          Obx(
            () => TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Password',
                prefixIcon: const Icon(Icons.person),
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
              obscureText: controller.showPassword.value,
              keyboardType: TextInputType.name,
            ),
          ),

          const SizedBox(height: 15),

          CustomEButton(
            onPressed: controller.signUpAndCreateUser,
            text: 'Sign Up',
          )
        ],
      ),
    );
  }
}
