import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CApploader {
  //show loader
  static Widget showLoader(String loadingMessage, String loadingImage) {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      height: MediaQuery.of(Get.context!).size.height,
      color: Colors.white,
      child: PopScope(
        canPop: false,
        child: Column(
          children: [
            //loader
            LottieBuilder.asset(loadingImage),

            const SizedBox(height: CSizes.lg),

            //text
            Text(loadingMessage)
          ],
        ),
      ),
    );
  }

  //stop loader
  static stopLoader() {
    Navigator.pop(Get.context!);
  }
}
