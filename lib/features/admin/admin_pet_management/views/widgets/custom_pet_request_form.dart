import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/user/user_pet_management/controllers/user_pet_request_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class CustomPetRequestForm extends StatelessWidget {
  const CustomPetRequestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final petController = Get.put(UserPetRequestController());

    //
    return Form(
      key: petController.requestFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Quanity of bottles'),
          const SizedBox(height: CSizes.sm),
          TextFormField(
            controller: petController.bottleQuantityCon,
            validator: (value) =>
                CValidators.validateEmptyText('Quantity of bottles', value),
            decoration: const InputDecoration(
              hintText: 'e.g 15',
              prefixIcon: Icon(
                Icons.water_drop_rounded,
                color: CColors.mainColor,
              ),
            ),
          ),

          //
          const SizedBox(height: CSizes.md),
          const Text('Pickup address'),
          const SizedBox(height: CSizes.sm),
          TextFormField(
            controller: petController.pickupAddressCon,
            validator: (value) =>
                CValidators.validateEmptyText('Pickup address', value),
            decoration: const InputDecoration(
              hintText: 'e.g No.4 atiku street, ajah ',
              prefixIcon: Icon(
                Icons.location_pin,
                color: CColors.mainColor,
              ),
            ),
          ),

          //
          const SizedBox(height: CSizes.md),
          const Text('Phone number'),
          const SizedBox(height: CSizes.sm),
          TextFormField(
            controller: petController.phoneNumberCon,
            validator: CValidators.validatePhoneNumber,
            decoration: const InputDecoration(
              hintText: '08128824153 ',
              prefixIcon: Icon(
                Icons.phone,
                color: CColors.mainColor,
              ),
            ),
          ),

          //
          const SizedBox(height: CSizes.md + 3),

          //
          CustomEButton(
            onPressed: petController.requestPickup,
            text: 'request a pickup',
            addIcon: false,
          )
        ],
      ),
    );
  }
}
