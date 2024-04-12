import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/features/user/user_personalization/model/faq_model.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/loaders/app_loader.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

import '../views/widgets/custom_add_adress_widget.dart';

class UserSettingsController extends GetxController {
  static UserSettingsController get instance => Get.find();


  ///variables
  final GlobalKey<FormState> addAdresskey = GlobalKey<FormState>();
  final contactNumberAddCon = TextEditingController();
  final completeAddressAddCon = TextEditingController();
  final nearbyLandmarkAddCon = TextEditingController();
  final networkManager = Get.put(NetWorkManager());

  //issue  view
  final emailCon = TextEditingController();
  final issueCon = TextEditingController();
  final GlobalKey<FormState> issueFormkey = GlobalKey<FormState>();

  //contact us view
  final fistNameCon = TextEditingController();
  final lastNameCon = TextEditingController();
  final phoneNumberCon = TextEditingController();
  final contactUsMessageCon = TextEditingController();
  final GlobalKey<FormState> contactUsFormkey = GlobalKey<FormState>();

  //faq
  //variables
  final List<FaqModel> allFaqs = List.generate(
      7,
      (index) => FaqModel(
          title: 'This is the heading $index', body: 'Body for $index'));
  Rx<FaqModel> tile = FaqModel.empty().obs;

  ///method for the faq panel expansion/collapsing
  void expandPanelCon(int index, bool isExpanded) {
    tile.value = allFaqs[index];
    tile.value.isExpanded = isExpanded;
  }

  ///method to add a new address
  void addAddress() async {
    await showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: Get.context!,
      builder: (context) {
        return const CustomAddAdressWidget();
      },
    );
  }

  ///method to save address
  void saveAddress() async {
    try {
      //showloader
      CApploader.showLoader('Adding address...', CImages.docerAnimation);

      //check network
      final value = await networkManager.checkInternet();
      if (!value) {
        CApploader.stopLoader();
        return;
      }

      //check form state
      if (!addAdresskey.currentState!.validate()) {
        CApploader.stopLoader();
        return;
      }

      //if all previous process have been checked then call the save user address method
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh Snap!', message: e.toString());
    }
  }

  ///method to report an issue
  void reportIssue() async {
    try {
      //showloader
      CApploader.showLoader('Sending issue message...', CImages.docerAnimation);

      //check network
      final value = await networkManager.checkInternet();
      if (!value) {
        CApploader.stopLoader();
        return;
      }

      //check form state
      if (issueFormkey.currentState != null) {
        if (!issueFormkey.currentState!.validate()) {
          CApploader.stopLoader();
          return;
        }
      }

      //if all previous process have been checked then call the report issue method
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh Snap!', message: e.toString());
    }
  }

  ///method to contact recycler
  void contactUs() async {
    try {
      //showloader
      CApploader.showLoader('Sending form...', CImages.docerAnimation);

      //check network
      final value = await networkManager.checkInternet();
      if (!value) {
        CApploader.stopLoader();
        return;
      }

      //check form state
      if (contactUsFormkey.currentState != null) {
        if (!contactUsFormkey.currentState!.validate()) {
          CApploader.stopLoader();
          return;
        }
      }

      //if all previous process have been checked then call thecontact us method
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh Snap!', message: e.toString());
    }
  }
}
