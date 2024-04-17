import 'package:flutter/material.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/texts.dart';

import 'widgets/custom_request_tabs_generally.dart';

class AdminRequestManager extends StatelessWidget {
  const AdminRequestManager({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminNotificationsController.instance;

    //
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text(
                  'Request Manager',
                  style: Theme.of(context).textTheme.titleLarge,
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
                          color:
                              controller.getColorBasedOnStatus(CTexts.pending),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        CTexts.accepted,
                        style: TextStyle(
                          color:
                              controller.getColorBasedOnStatus(CTexts.accepted),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        CTexts.completed,
                        style: TextStyle(
                          color: controller
                              .getColorBasedOnStatus(CTexts.completed),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        CTexts.declined,
                        style: TextStyle(
                          color:
                              controller.getColorBasedOnStatus(CTexts.declined),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
            body: TabBarView(
              children: [
                CustomRequestTabsGenerally(
                  requests: controller.pendingRequests,
                ),
                CustomRequestTabsGenerally(
                  requests: controller.acceptedRequests,
                ),
                CustomRequestTabsGenerally(
                  requests: controller.completedRequests,
                ),
                CustomRequestTabsGenerally(
                  requests: controller.declinedRequests,
                ),
              ],
            ),
          )),
    );
  }
}
