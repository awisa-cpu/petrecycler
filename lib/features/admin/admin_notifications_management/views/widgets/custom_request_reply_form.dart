import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_reply_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

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
    return Form(
      key: controller.replyFommKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Schedule Pickup'),
          const SizedBox(height: CSizes.md),
          TextFormField(
            controller: controller.scheduleReplyDate,
            autofocus: true,
            decoration: const InputDecoration(labelText: '23-04-2024'),
          ),
          const SizedBox(height: CSizes.md),
          TextFormField(
            controller: controller.scheduleReplyTime,
            autofocus: true,
            decoration: const InputDecoration(labelText: '3pm'),
          ),
          const SizedBox(height: CSizes.md + 3),
          CustomEButton(
            onPressed: () =>
                controller.adminReplyToRequest(request, 'accepted'),
            text: 'Submit',
            addIcon: true,
            icon: Iconsax.send1,
          )
        ],
      ),
    );
  }
}
