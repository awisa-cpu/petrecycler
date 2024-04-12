
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petrecycler/features/autentication/views/sign_in/sign_in.dart';

class OnBoardingController extends GetxController {
  //
  static OnBoardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final deviceStorage = GetStorage();

  //update current index when page scrolls
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  //jump to the specifi dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //update current index and jump to next page
  void nextPage() {
    if (currentPageIndex.value != 2) {
      currentPageIndex.value++;
      pageController.jumpToPage(currentPageIndex.value);
    } else {
      deviceStorage.write('isFirstTime', false);
      Get.offAll(()=>const SignInView());
    }
  }

  void skipPage() {
    deviceStorage.writeIfNull('isFirstTime', false);
    Get.offAll(()=>const SignInView());
  }
}
