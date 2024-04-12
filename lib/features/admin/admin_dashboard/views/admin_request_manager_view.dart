import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/custom_activity.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class AdminRequestManager extends StatelessWidget {
  const AdminRequestManager({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text(
                  'Request Manager',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                bottom: const TabBar(
                  indicatorColor: CColors.mainColor,
                  labelColor: CColors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Text('Pending'),
                    ),
                    Tab(
                      child: Text('Copleted'),
                    ),
                    Tab(
                      child: Text('Declined'),
                    ),
                  ],
                ),
              )
            ],
            body: const TabBarView(
              children: [
                RequestTabs(),
                RequestTabs(),
                RequestTabs(),
              ],
            ),
          )),
    );
  }
}

class RequestTabs extends StatelessWidget {
  const RequestTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
          child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (_, index) {
          final style = Theme.of(context).textTheme.bodyMedium;
          return CustomActivity(
            leading: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pending',
                  style: style,
                ),
                const CustomRoundedContainer(
                  backgroundColor: Colors.red,
                  width: 15,
                  height: 15,
                  radius: 40,
                ),
              ],
            ),
            title: 'Amos Luke Tom ',
            subTitle: 'No. 4 Atiku',
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('58 ', style: style),
                Text(
                  '12-02-24',
                  style: style,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
