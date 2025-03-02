import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_reply_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomDeclineRequestForm extends StatelessWidget {
  const CustomDeclineRequestForm({super.key, required this.request});
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminReplyController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Decline Request',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Form(
          key: controller.adminDeclineKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Are you sure you want to declining',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: CSizes.lg),
              Text(
                'Please provide the user with a reason for decline',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: CSizes.md),
              TextFormField(
                controller: controller.declineCon,
                decoration:
                    const InputDecoration(labelText: 'Reason for rejection'),
              ),
              const SizedBox(height: CSizes.lg),
              CustomEButton(
                onPressed: () {
                  Navigator.pop(Get.context!);
                  controller.adminReplyToDeclineRequest(request, 'declined');
                },
                text: 'Reply',
                addIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
