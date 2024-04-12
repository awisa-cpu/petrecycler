import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/buttons/custom_icon_button.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

import 'widgets/account_data.dart';
import 'widgets/personal_data.dart';

class AdminAccountInformationView extends StatelessWidget {
  const AdminAccountInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, value) => [
            SliverAppBar(
              title: Text('Account Information',
                  style: Theme.of(context).textTheme.titleLarge),
              backgroundColor: CColors.light,
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Tab(
                      child: Text('Company Data',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ]),
            )
          ],
          body: const TabBarView(
            children: [
              AccountData(),
              PersonalData(),
            ],
          ),
        ),
      ),
    );
  }
}
