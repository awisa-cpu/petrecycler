import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomAdressInformation extends StatelessWidget {
  const CustomAdressInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    //
    return CustomRoundedContainer(
      showBorder: true,
      borderColor: CColors.mainColor,
      padding: const EdgeInsets.all(CSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //child 1
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Iconsax.home,
                    color: CColors.mainColor,
                  ),
                  SizedBox(width: CSizes.md),
                  Text('Home')
                ],
              ),

              //child 2
              Checkbox(value: false, onChanged: (value) {})
            ],
          ),
          const SizedBox(height: CSizes.md),
          Text(
            userController.user.value.address,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: CSizes.md),
          Text(
            userController.user.value.phoneNumber,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
