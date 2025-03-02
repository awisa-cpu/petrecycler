import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

import 'custom_request_widget.dart';

class CustomRequestTabsGenerally extends StatelessWidget {
  const CustomRequestTabsGenerally({super.key, required this.requests});
  final List<RequestModel> requests;

  @override
  Widget build(BuildContext context) {
    final controller = AdminNotificationsController.instance;

    //
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
          child: Obx(
        () => ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: requests.length,
          itemBuilder: (_, index) {
            final request = requests[index];

            return requests.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      //mark as read
                      controller.markAsRead(request);

                      request.status == CTexts.pending
                          ? controller.showRequestPendingInfoDialog(request)
                          : request.status == CTexts.accepted
                              ? controller
                                  .showRequestAcceptedInfoDialog(request)
                              : null;
                    },
                    child: CustomRequestWidget(request: request),
                  )
                : const Center(
                    child: Text('Empty'),
                  );
          },
        ),
      )),
    );
  }
}
