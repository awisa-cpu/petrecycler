import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/autentication/controllers/sign_in_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    //
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Settings Page'),
            ElevatedButton(
              onPressed: controller.logoutUser,
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
