import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/features/user/user_pet_management/views/widgets/custom_request_title_with_icon.dart';
import 'package:petrecycler/features/user/user_personalization/views/widgets/custom_add_address_form.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomAddAdressWidget extends StatelessWidget {
  const CustomAddAdressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(CSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRequestTitleWithIcon(
              icon: Iconsax.location,
              title: 'Address Details',
              height: 40,
              width: 40,
            ),
            Text(
              'Provide a complete address as this would assist us in serving you better',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.sm),
            const Divider(),
            const SizedBox(height: CSizes.sm),
            const CustomAddAddressForm()
          ],
        ),
      ),
    );
  }
}
