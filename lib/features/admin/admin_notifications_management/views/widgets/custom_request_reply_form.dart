import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_reply_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';
import 'package:petrecycler/utilities/validators/validators.dart';

class CustomRequestReplyForm extends StatelessWidget {
  const CustomRequestReplyForm({
    super.key,
    required this.request,
  });
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminReplyController());

    //
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm user details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Obx(
        () => CustomLayoutWithScrollAndPadding(
          child: Form(
            key: controller.replyFommKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: CDeviceUtility.getScreenHeight(context) * 0.13,
                ),
                Text(
                  'Schedule a Pickup!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: CSizes.md),
                Text(
                  'Pick a date and time!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: CSizes.lg),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.dopController,
                        validator: (value) =>
                            CValidators.validateEmptyText('Date', value),
                        decoration: InputDecoration(
                          enabled: false,
                          hintText: controller.adminReplyDate.value,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.selectDateOfPickup();
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.lg),
                const Text('Select Time of Pickup '),
                const SizedBox(height: CSizes.md),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.topController,
                        validator: (value) =>
                            CValidators.validateEmptyText('Time', value),
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: controller.adminReplyTime.value),
                      ),
                    ),
                    IconButton(
                      onPressed: controller.selectTimeOfPickup,
                      icon: const Icon(Icons.watch_later_rounded),
                    )
                  ],
                ),
                const SizedBox(height: CSizes.md + 3),

                //
                CustomEButton(
                  onPressed: () {
                    controller.adminReplyToRequest(request, 'accepted');
                    Navigator.of(context).pop();
                  },
                  text: 'Submit',
                  addIcon: true,
                  icon: Iconsax.send1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
