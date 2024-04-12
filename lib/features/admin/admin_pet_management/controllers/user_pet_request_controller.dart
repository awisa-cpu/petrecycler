import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/utilities/loaders/app_loader.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class UserPetRequestController extends GetxController {
  static UserPetRequestController get instance => Get.find();

  //variables
  final bottleQuantityCon = TextEditingController();
  final pickupAddressCon = TextEditingController();
  final phoneNumberCon = TextEditingController();
  final GlobalKey<FormState> requestFormKey = GlobalKey<FormState>();

  //methods

  void requestPickup() {
    try {
      if (requestFormKey.currentState != null) {
        if (!requestFormKey.currentState!.validate()) {
          // CApploader.stopLoader();
          return;
        }
      }

      //call the method responsible
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh snap', message: e.toString());
    }
  }
}
