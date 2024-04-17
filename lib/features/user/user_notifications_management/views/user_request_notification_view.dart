import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/buttons/custom_icon_button.dart';
import 'package:petrecycler/features/user/user_notifications_management/controllers/user_notifications_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/controllers/user_pickup_request_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

import 'widgets/user_custom_requests_tab.dart';

class UserRequestNotificationsView extends StatelessWidget {
  const UserRequestNotificationsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final requestController = UserPickupRequestController.instance;
    final notificationController = Get.put(UserNotificationsController());

    //
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, value) => [
            SliverAppBar(
              title: Text('Requests',
                  style: Theme.of(context).textTheme.titleLarge),
              backgroundColor: CColors.light,
              pinned: true,
              floating: true,
              leading: CustomIconButton(
                icon: Icons.arrow_back,
                action: () {
                  Get.back();
                  requestController.bottleQuantityCon.clear();
                  requestController.pickupAddressCon.clear();
                  requestController.phoneNumberCon.clear();
                },
              ),
              bottom: TabBar(
                indicatorColor: CColors.mainColor,
                labelColor: CColors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontSize: 12),
                tabs: [
                  Tab(
                    child: Text(
                      CTexts.pending,
                      style: TextStyle(
                        color: notificationController
                            .getColorBasedOnStatus(CTexts.pending),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      CTexts.accepted,
                      style: TextStyle(
                        color: notificationController
                            .getColorBasedOnStatus(CTexts.accepted),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      CTexts.completed,
                      style: TextStyle(
                        color: notificationController
                            .getColorBasedOnStatus(CTexts.completed),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      CTexts.declined,
                      style: TextStyle(
                        color: notificationController
                            .getColorBasedOnStatus(CTexts.declined),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
          body: TabBarView(
            children: [
              UserCustomRequestsTab(
                  requests: notificationController.pendingRequests),
              UserCustomRequestsTab(
                  requests: notificationController.acceptedRequests),
              UserCustomRequestsTab(
                  requests: notificationController.completedRequests),
              UserCustomRequestsTab(
                  requests: notificationController.declinedRequests),
            ],
          ),
        ),
      ),
    );
  }
}
