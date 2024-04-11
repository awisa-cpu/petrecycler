import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_settings_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class CustomAddAddressForm extends StatelessWidget {
  const CustomAddAddressForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsCon = UserSettingsController.instance;
    return Form(
      key: settingsCon.addAdresskey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) =>
                CValidators.validateEmptyText('Contact Number', value),
            decoration: const InputDecoration(labelText: 'Contact Number'),
          ),

          //
          const SizedBox(height: CSizes.md),

          //
          TextFormField(
            validator: (value) =>
                CValidators.validateEmptyText('Complete address', value),
            decoration: const InputDecoration(labelText: 'Complete address'),
          ),

          //
          const SizedBox(height: CSizes.md),

          //
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'Nearby Landmark(optional)'),
          ),
          const SizedBox(height: CSizes.lg),

          CustomEButton(
            onPressed: settingsCon.saveAddress,
            text: 'Save address',
            addIcon: false,
          ),
        ],
      ),
    );
  }
}
