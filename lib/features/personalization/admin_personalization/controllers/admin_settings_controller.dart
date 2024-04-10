import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/features/autentication/views/sign_in/forgot_password.dart';
import 'package:petrecycler/features/personalization/admin_personalization/model/admin_settings_model.dart';
import 'package:petrecycler/features/personalization/admin_personalization/views/settings/admin_account_info_view.dart';
import 'package:petrecycler/features/personalization/admin_personalization/views/settings/admin_address_info_view.dart';
import 'package:petrecycler/features/personalization/admin_personalization/views/settings/admin_issues_help_view.dart';

class AdminSettingsController extends GetxController {
  static AdminSettingsController get instance => Get.find();

  ///variables
  final List<AdminSettingsModel> generalSettings = [
    //
    AdminSettingsModel(
      title: 'Account Information',
      icon: Icons.person,
      action: () => Get.to(
        () => const AdminAccountInformationView(),
      ),
    ),

    AdminSettingsModel(
      title: 'Address Information',
      icon: Iconsax.location,
      action: () => Get.to(
        () => const AdminAddressInformationView(),
      ),
    ),
    AdminSettingsModel(
      title: 'Password Manager',
      icon: Icons.password,
      action: () => Get.to(() => const ForgotPasswordView(
            text: 'Password Manager',
            actionText: 'Change Password',
          )),
    ),
    AdminSettingsModel(
      title: 'Help Center',
      icon: Icons.help,
      action: () => Get.to(() => const AdminIssuesHelpView()),
    ),
  ];
}
