import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CApploader {
  //show loader
  static void showLoader(String loadingMessage, String loadingImage) async {
    return await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (
        context,
      ) =>
          PopScope(
        canPop: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 200),

                //loader
                LottieBuilder.asset(
                  loadingImage,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),

                const SizedBox(height: CSizes.lg),

                //text
                Text(
                  loadingMessage,
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //stop loader
  static void stopLoader() {
    Navigator.pop(Get.overlayContext!);
  }
}
