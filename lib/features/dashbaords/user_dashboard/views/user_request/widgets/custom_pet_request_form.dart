import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomPetRequestForm extends StatelessWidget {
  const CustomPetRequestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quanity of bottles'),
        const SizedBox(height: CSizes.sm),
        TextFormField(
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
          decoration: const InputDecoration(
            hintText: '08128824153 ',
            prefixIcon: Icon(
              Icons.phone,
              color: CColors.mainColor,
            ),
          ),
        ),
      ],
    ));
  }
}
