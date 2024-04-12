import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_settings_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsCon = Get.put(UserSettingsController());

    //
    return Form(
      key: settingsCon.contactUsFormkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('First Name'),
          const SizedBox(height: CSizes.md),
          TextFormField(
            controller: settingsCon.fistNameCon,
            validator: (value) =>
                CValidators.validateEmptyText('First Name', value),
          ),
          const SizedBox(height: CSizes.lg),
          const Text('Last Name'),
          const SizedBox(height: CSizes.md),
          TextFormField(
            controller: settingsCon.lastNameCon,
            validator: (value) =>
                CValidators.validateEmptyText('Last Name', value),
          ),
          const SizedBox(height: CSizes.lg),
          const Text('Phone number'),
          const SizedBox(height: CSizes.md),
          TextFormField(
            controller: settingsCon.phoneNumberCon,
            validator: (value) =>
                CValidators.validateEmptyText('Phone Number', value),
          ),
          const SizedBox(height: CSizes.lg),
          const Text('Message'),
          const SizedBox(height: CSizes.md),
          TextFormField(
            controller: settingsCon.contactUsMessageCon,
            validator: (value) =>
                CValidators.validateEmptyText('Message', value),
            maxLines: 6,
            decoration:
                const InputDecoration(hintText: 'Type your message here'),
          ),
          const SizedBox(height: CSizes.lg),
          CustomEButton(
            onPressed: settingsCon.contactUs,
            text: 'Send Message',
            addIcon: true,
            icon: Iconsax.send1,
          ),
          const SizedBox(height: CSizes.lg)
        ],
      ),
    );
  }
}
