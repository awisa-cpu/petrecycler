import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/common/widgets/buttons/custom_icon_button.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/account_info_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

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
                        unselectedLabelStyle:
                            TextStyle(color: Colors.grey[300]),
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
            )),
      ),
    );
  }
}

class AccountData extends StatelessWidget {
  const AccountData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountInfoController());
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              'Email address',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'destinyawisa@gmail.com',
              ),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Password',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            Obx(
              () => TextFormField(
                decoration: InputDecoration(
                  hintText: '************',
                  suffixIcon: IconButton(
                    enableFeedback: false,
                    onPressed: controller.passwordToggler,
                    icon: Icon(
                      controller.togglePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: controller.togglePassword.value,
              ),
            ),

            const SizedBox(height: CSizes.lg),
            Text(
              'Delete Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Your account will be permanently removed from the application. All your data will be lost',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: CSizes.lg),

            CustomEButton(
              onPressed: () {},
              text: 'Delete Account',
              addIcon: false,
            )
          ],
        ),
      ),
    );
  }
}

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomLayoutWithScrollAndPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              'First name',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Destiny',
              ),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Awisa',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              decoration: const InputDecoration(hintText: '************'),
            ),

            const SizedBox(height: CSizes.lg),

            Text(
              'Phone number',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: CSizes.md),
            TextFormField(
              decoration: const InputDecoration(hintText: '08128824153'),
            ),
          ],
        ),
      ),
    );
  }
}
