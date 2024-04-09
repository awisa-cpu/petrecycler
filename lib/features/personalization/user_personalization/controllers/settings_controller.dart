import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/features/autentication/views/sign_in/forgot_password.dart';
import 'package:petrecycler/features/personalization/user_personalization/model/user_settings_model.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/account_info_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/address_info_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/contact_us_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/faq_view.dart';
import 'package:petrecycler/features/personalization/user_personalization/views/settings/report_issue_view.dart';

class UserSettingsController extends GetxController {
  static UserSettingsController get instance => Get.find();

  ///variables
  final List<UserSettingsModel> generalSettings = [
    UserSettingsModel(
      title: 'Account Information',
      icon: Icons.person,
      () => Get.to(() => const AccountInformationView()),
    ),
    UserSettingsModel(
      title: 'Address Information',
      icon: Iconsax.location,
      () => Get.to(() => const AddressInformationView()),
    ),
    UserSettingsModel(
      title: 'Password Manager',
      icon: Icons.password,
      () => Get.to(() => const ForgotPasswordView(
            text: 'Password Manager',
            actionText: 'Change Password',
          )),
    ),
  ];

  //
  final List<UserSettingsModel> supportSettings = [
    UserSettingsModel(
      title: 'Report an issue',
      icon: Iconsax.notification,
      () => Get.to(() => const ReportIssueView()),
    ),
    UserSettingsModel(
      title: 'Contact Us',
      icon: Iconsax.call,
      () => Get.to(() => const ContactUsView()),
    ),
    UserSettingsModel(
      title: 'FAQ',
      icon: Iconsax.info_circle,
      () => Get.to(() => const FaqView()),
    ),
  ];
}
