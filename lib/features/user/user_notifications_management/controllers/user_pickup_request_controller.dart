import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/data/services/notification_service/notification_service.dart';
import 'package:petrecycler/features/user/user_navigation/user_navigation_menu.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/fcm_notification_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_controller.dart';
import 'package:petrecycler/utilities/loaders/overlay_loading_screen.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';

class UserPickupRequestController extends GetxController {
  static UserPickupRequestController get instance => Get.find();

  //variables
  final _firebaseDb = FirebaseFirestore.instance;
  final bottleQuantityCon = TextEditingController();
  final pickupAddressCon = TextEditingController();
  final phoneNumberCon = TextEditingController();
  final bottleFormKey = GlobalKey<FormState>();

  //methods
  @override
  void onClose() {
    bottleQuantityCon.dispose();
    pickupAddressCon.dispose();
    phoneNumberCon.dispose();
    super.onClose();
  }

  void requestPickup() async {
    try {
      //start loader
      CustomOverlayLoader().startLoader(
          context: Get.overlayContext!, text: 'Submitting requests...');

      //check network connectivity
      final isConnected = await NetWorkManager.instance.checkInternet();
      if (!isConnected) {
        CustomOverlayLoader().stopLoader();
        return;
      }

      //check form details
      if (bottleFormKey.currentState?.validate() != true) {
        CustomOverlayLoader().stopLoader();
        return;
      }
      final user = UserController.instance.user.value;
      final userFullName = "${user.surName} ${user.firstName!}";

      //create a request instance with the uid of the current user
      final request = RequestModel(
        senderId: AuthRepository.instance.authUser!.uid,
        status: 'pending',
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        bottleQuantity: bottleQuantityCon.text.trim(),
        address: pickupAddressCon.text.trim(),
        phoneNumber: phoneNumberCon.text.trim(),
        readStatus: false,
        senderName: userFullName,
      );

      //using transaction to add the document and send the notification atomically
      //if an error occurs while sending the notification, the transaction will be rolled
      //back, and the document will not be added

      await _firebaseDb.runTransaction(
        (transaction) async {
          //add the pickup request to firestore
          DocumentReference newRequestRef =
              _firebaseDb.collection("Requests").doc();
          transaction.set(newRequestRef, request.toJson());

          final adminId = UserController.instance.admin.value.uid;
          final notification = FcmNotificationModel(
            userId: adminId,
            title: "New notification",
            body: "Pickup request from ${user.phoneNumber}",
            data: FcmData(notificationType: 'adminNotification'),
          );

          await NotificationService.instance
              .sendNotificationRequest(notification);

          // notify the user of successful operation
          CustomSnackBars.showSuccessSnackBar(
            title: 'Congrats!',
            message: 'pickup request sent, please wait for confirmation',
          );

          //push to usernotificationsView
          Get.to(() => const UserNavigationMenu());
        },
      );
    } on TimeoutException catch (e) {
      CustomOverlayLoader().stopLoader();
      Logger().i(e);
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh snap', message: 'Time out, please try again');
    } on SocketException catch (e) {
      CustomOverlayLoader().stopLoader();
      Logger().i(e);
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh snap', message: 'Somethig wrong with the network');
    } catch (e) {
      CustomOverlayLoader().stopLoader();
      Logger().i(e);
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh snap', message: 'Somethig went wrong, try again');
    } finally {
      CustomOverlayLoader().stopLoader();
    }
  }
}
