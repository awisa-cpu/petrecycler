import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_settings_controller.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class CustomReportIssueForm extends StatelessWidget {
  const CustomReportIssueForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsCon = Get.put(UserSettingsController());

    //
    return Form(
      key: settingsCon.issueFormkey,
      child: Column(
        children: [
          //
          Text(
            'Are you concerned about something? Just tell us about your issue',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: CSizes.lg),

          //
          TextFormField(
            controller: settingsCon.emailCon,
            validator: CValidators.validateEmail,
            decoration: const InputDecoration(
                labelText: CTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),

          const SizedBox(height: CSizes.lg),

          //
          TextFormField(
            controller: settingsCon.issueCon,
            validator: (value) =>
                CValidators.validateEmptyText('Write an issue', value),
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Write issue here',
              prefixIcon: Icon(Iconsax.notification),
            ),
          ),

          const SizedBox(height: CSizes.lg),

          CustomEButton(
            onPressed: settingsCon.reportIssue,
            text: 'Report',
            addIcon: true,
            icon: Iconsax.send1,
          )
        ],
      ),
    );
  }
}
