import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/autentication/controllers/sign_up_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.userTypeAdmin,
  });
  final bool userTypeAdmin;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    //
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first name & company name
          userTypeAdmin
              ? TextFormField(
                  validator: (value) =>
                      CValidators.validateEmptyText('Company name', value),
                  controller: controller.companyName,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Company Name',
                      prefixIcon: const Icon(Icons.person)),
                  keyboardType: TextInputType.name,
                )
              : TextFormField(
                  validator: (value) =>
                      CValidators.validateEmptyText('First name', value),
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

          const SizedBox(height: CSizes.md),

          //sur name & company contact person
          userTypeAdmin
              ? TextFormField(
                  validator: (value) =>
                      CValidators.validateEmptyText('Contact name', value),
                  controller: controller.contactPersonName,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Name of company contact person',
                      prefixIcon: const Icon(Icons.person)),
                  keyboardType: TextInputType.name,
                )
              : TextFormField(
                  validator: (value) =>
                      CValidators.validateEmptyText('Surname', value),
                  controller: controller.surName,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Surname',
                      prefixIcon: const Icon(Icons.person)),
                  keyboardType: TextInputType.name,
                ),

          const SizedBox(height: 15),

          //email for both users
          TextFormField(
            validator: (value) => CValidators.validateEmail(value),
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

          //phone number for both users
          TextFormField(
            validator: (value) => CValidators.validatePhoneNumber(value),
            controller: controller.telephoneOrPhoneNo,
            decoration: InputDecoration(
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: userTypeAdmin ? 'Telephone No.' : 'Phone Number',
                prefixIcon: const Icon(Icons.phone)),
            keyboardType: TextInputType.name,
          ),

          const SizedBox(height: CSizes.md),

          //address for both users
          TextFormField(
            validator: (value) => CValidators.validateEmptyText(
                userTypeAdmin ? 'Company address' : 'Address', value),
            controller: controller.address,
            decoration: InputDecoration(
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: userTypeAdmin ? 'Company address' : 'Address',
                prefixIcon: const Icon(Icons.home)),
            keyboardType: TextInputType.name,
          ),

          userTypeAdmin
              ? const SizedBox(height: CSizes.md)
              : const SizedBox.shrink(),

          //LGA
          userTypeAdmin
              ? TextFormField(
                  validator: (value) =>
                      CValidators.validateEmptyText('LGA', value),
                  controller: controller.lga,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'LGA',
                      prefixIcon: const Icon(Icons.home)),
                  keyboardType: TextInputType.name,
                )
              : const SizedBox.shrink(),

          userTypeAdmin
              ? const SizedBox(height: CSizes.md)
              : const SizedBox.shrink(),

          //RC no.
          userTypeAdmin
              ? TextFormField(
                  validator: (value) =>
                      CValidators.validateEmptyText('Rc No.', value),
                  controller: controller.rcn,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Rc No.',
                      prefixIcon: const Icon(Icons.home)),
                  keyboardType: TextInputType.name,
                )
              : const SizedBox.shrink(),

          const SizedBox(height: CSizes.md),

          //password
          Obx(
            () => TextFormField(
              validator: (value) => CValidators.validatePassword(value),
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

          userTypeAdmin
              ? CustomEButton(
                  onPressed: () => controller.signUpUser(CTexts.admin),
                  text: CTexts.signUp,
                  addIcon: false,
                )
              : CustomEButton(
                  onPressed: () => controller.signUpUser(CTexts.user),
                  text: CTexts.signUp,
                  addIcon: false,
                )
        ],
      ),
    );
  }
}
