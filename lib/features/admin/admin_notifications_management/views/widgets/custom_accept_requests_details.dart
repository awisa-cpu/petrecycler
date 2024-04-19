import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_reply_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/widgets/custom_request_title_with_icon.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomAcceptRequestsDetails extends StatelessWidget {
  const CustomAcceptRequestsDetails({super.key, required this.request});
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.put(AdminReplyController());

    //
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(CSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRequestTitleWithIcon(
              icon: Iconsax.notification,
              title: 'Confirm Request Completed',
              height: 40,
              width: 40,
            ),
            const SizedBox(height: CSizes.sm),
            const Divider(),

            //
            const SizedBox(height: CSizes.sm),
            Text(
              'Sender Name',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: CSizes.sm),
            Text(
              request.senderName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: CSizes.md),
            Text(
              'Phone Number',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: CSizes.sm),
            Text(request.phoneNumber),

            const SizedBox(height: CSizes.md),
            Text(
              'Address',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: CSizes.sm),
            Text(request.address),

            const SizedBox(height: CSizes.md),
            Text(
              'Bottle Quantity',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: CSizes.sm),
            Text(request.bottleQuantity),
            const SizedBox(height: CSizes.sm),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomEButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      notificationController.adminReplyToRequest(
                        request,
                        "completed",
                      );
                    },
                    text: 'Yes, Complete',
                    addIcon: true,
                    icon: Iconsax.add,
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: CustomEButton(
                    onPressed: () => Navigator.pop(Get.overlayContext!),
                    text: 'No',
                    addIcon: true,
                    icon: Icons.cancel,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
