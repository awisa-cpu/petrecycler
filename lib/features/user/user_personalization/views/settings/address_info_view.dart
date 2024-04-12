import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';
import 'package:petrecycler/features/autentication/model/user_model.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_settings_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

import '../widgets/custom_adress_information.dart';

class AddressInformationView extends StatelessWidget {
  const AddressInformationView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final settingsCon = Get.put(UserSettingsController());

    //
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Address Information'),
        showCenterTitle: true,
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Column(
          children: [
            //first section
            CustomEButton(
              onPressed: settingsCon.addAddress,
              text: 'Add New Address',
              addIcon: true,
              icon: Icons.add,
            ),

            const SizedBox(height: CSizes.lg),

            const CustomAdressInformation(),
          ],
        ),
      ),
    );
  }
}
