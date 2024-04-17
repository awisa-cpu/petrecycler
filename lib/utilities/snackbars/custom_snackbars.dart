import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBars {
//error snackbar
  static showErrorSnackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

//success snackbar
  static showSuccessSnackBar({required title, required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue[300],
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

//info snack bar
  static showInforSnackBar(
      {required String title,
      required String message,
      bool showOnTap = false,
      VoidCallback? onPressed,
      }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      onTap: showOnTap
          ? (value)=>onPressed
          : null,
    );
  }
}
