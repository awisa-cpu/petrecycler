import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/loaders/app_loader.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  ///variables
  final GlobalKey<FormState> passwordResetKey = GlobalKey<FormState>();
  final networkManager = Get.put(NetWorkManager());
  final emailController = TextEditingController();

  void forgotPasswordReset() async {
    try {
      //showloader
      CApploader.showLoader('password ...', CImages.docerAnimation);

      //check network
      final value = await networkManager.checkInternet();
      if (!value) {
        CApploader.stopLoader();
        return;
      }

      //check form state
      if (!passwordResetKey.currentState!.validate()) {
        CApploader.stopLoader();
        return;
      }

      //if all previous process have been checked then call the forgot password
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh Snap!', message: e.toString());
    }
  }
}
