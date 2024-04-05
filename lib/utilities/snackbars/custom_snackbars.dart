import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBars {
//error snackbar
  static showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

//success snackbar
  static showSuccessSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue[300],
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

//info snack bar
  static showInforSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
