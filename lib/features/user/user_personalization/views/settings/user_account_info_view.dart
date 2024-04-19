import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/buttons/custom_icon_button.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

import '../widgets/user_account_data.dart';
import '../widgets/user_personal_data.dart';

class UserAccountInformationView extends StatelessWidget {
  const UserAccountInformationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, value) => [
            SliverAppBar(
              title: Text(
                'Account Information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              backgroundColor: Colors.white,
              pinned: true,
              floating: true,
              leading: CustomIconButton(
                icon: Icons.arrow_back,
                action: () => Get.back(),
              ),
              bottom: TabBar(
                indicatorColor: CColors.mainColor,
                labelColor: Colors.grey.shade100,
                enableFeedback: false,
                unselectedLabelStyle: TextStyle(color: Colors.grey[300]),
                tabs: [
                  Tab(
                    child: Text(
                      'Account Data',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Personal Data',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            )
          ],
          body: const TabBarView(
            children: [
              UserAccountData(),
              UserPersonalData(),
            ],
          ),
        ),
      ),
    );
  }
}
