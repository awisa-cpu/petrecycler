import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/admin/admin_dashboard/views/admin_home/admin_home_view.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/views/admin_request_manager_view.dart';
import 'package:petrecycler/features/admin/admin_personalization/views/admin_settings/admin_settings_view.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import '../../../common/widgets/icons/custom_nav_icon.dart';

///responsible for managing app menu navigation
class AdminNavigationMenu extends StatelessWidget {
  const AdminNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNavigationController());

    //
    return Obx(
      () => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: CColors.mainColor,
          index: controller.selectedIndex.value,
          animationCurve: Curves.elasticIn,
          animationDuration: const Duration(milliseconds: 280),
          onTap: controller.onDestinationSelected,
          items: const [
            // CustomNavIcon(
            //   icon: Icons.location_on,
            // ),
            CustomNavIcon(
              icon: Icons.notifications,
            ),
            CustomNavIcon(
              icon: Icons.dashboard,
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

class AdminNavigationController extends GetxController {
  static AdminNavigationController get instance => Get.find();

  //varibales
  RxInt selectedIndex = 1.obs;

  //methods
  void onDestinationSelected(int index) {
    selectedIndex.value = index;
  }

  Widget displayScreen(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const AdminRequestManager();

      // case 1:
      //   return const AdminMapView();
      case 1:
        return const AdminHomeView();
      case 2:
        return const AdminSettingsView();
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
