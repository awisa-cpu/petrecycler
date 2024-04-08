import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/dashbaords/user_dashboard/views/bookings_view.dart';
import 'package:petrecycler/features/mapping/views/user_map_view.dart';
import 'package:petrecycler/features/dashbaords/user_dashboard/views/settings_view.dart';
import 'package:petrecycler/features/dashbaords/user_dashboard/views/user_home_view.dart';
import 'package:petrecycler/features/dashbaords/user_dashboard/views/withdraw_view.dart';

import '../../common/widgets/icons/custom_nav_icon.dart';

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
          color: Colors.blue.shade300,
          index: controller.selectedIndex.value,
          animationCurve: Curves.elasticIn,
          animationDuration: const Duration(milliseconds: 280),
          onTap: controller.onDestinationSelected,
          items: const [
            CustomNavIcon(
              icon: Icons.book_rounded,
            ),
            CustomNavIcon(
              icon: Icons.location_on,
            ),
            CustomNavIcon(
              icon: Icons.home,
            ),
            CustomNavIcon(
              icon: Icons.wallet_rounded,
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
  RxInt selectedIndex = 2.obs;

  //methods
  void onDestinationSelected(int index) {
    selectedIndex.value = index;
  }

  Widget displayScreen(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const UserHomeView();
      case 1:
        return const UserMapView();
      case 2:
        return const BookingsView();
      case 3:
        return const WithdrawView();
      case 4:
        return const SettingsView();
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}