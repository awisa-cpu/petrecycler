import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/user_request_view.dart';
import 'package:petrecycler/features/user/user_personalization/views/user_settings/user_settings_view.dart';
import 'package:petrecycler/features/user/user_dashboard/views/user_home/user_home_view.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

import '../../../common/widgets/icons/custom_nav_icon.dart';

///responsible for managing app menu navigation
class UserNavigationMenu extends StatelessWidget {
  const UserNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    //
    return Obx(
      () => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: CColors.mainColor,
          index: controller.selectedIndex.value,
          animationCurve: Curves.bounceIn,
          animationDuration: const Duration(milliseconds: 200),
          onTap: controller.onDestinationSelected,
          items: const [
         
            // CustomNavIcon(
            //   icon: Icons.location_on,
            // ),
            CustomNavIcon(
              icon: Icons.book_rounded,
            ),
               CustomNavIcon(
              icon: Icons.home,
            ),
            CustomNavIcon(
              icon: Icons.person,
            ),
          ],
        ),
        body: controller.displayScreen(controller.selectedIndex.value),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  //varibales
  RxInt selectedIndex = 1.obs;

  //methods
  void onDestinationSelected(int index) {
    selectedIndex.value = index;
  }

  Widget displayScreen(int currentIndex) {
    switch (currentIndex) {
      case 0:
         return const UserRequestView();
      
      // case 1:
      //   return const UserMapView();
      case 1:
       return const UserHomeView();
      case 2:
        return const UserSettingsView();
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
