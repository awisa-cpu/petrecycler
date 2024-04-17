import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/data/services/notification_service/notification_service.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/fcm_notification_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/user_request_notification_view.dart';
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
  final GlobalKey<FormState> requestFormKey = GlobalKey<FormState>();

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
      //start loder
      CustomOverlayLoader().startLoader(
          context: Get.overlayContext!, text: 'Submitting requests...');

      //check network connectivity
      final isConnected = await NetWorkManager.instance.checkInternet();
      if (!isConnected) {
        CustomOverlayLoader().stopLoader();
        return;
      }

      //check form details
      if (requestFormKey.currentState != null) {
        if (!requestFormKey.currentState!.validate()) {
          CustomOverlayLoader().stopLoader();
          return;
        }
      }

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
      );

      //using transaction to add the document and send the notification atomically
      //if an error occurs while sending the notification, the transaction will be rolled
      //back, and the document will not be added

      _firebaseDb.runTransaction((transaction) async {
        //add the pickup request to firestore
        DocumentReference newRequestRef =
            _firebaseDb.collection("Requests").doc();
        transaction.set(newRequestRef, request.toJson());

        await _firebaseDb.collection('Requests').doc().set(request.toJson());

        final notification = FcmNotificationModel(
          userId: 'odYGQdEFOiUARRkKZOTNDH3Jjav1',
          title: "New notification",
          body: "Pickup request from ${AuthRepository.instance.authUser!.uid}",
          data: FcmData(notificationType: 'adminNotification'),
        );

        // userId: UserController.instance.admin.value.uid,
        // Logger().i('admin Id: ${UserController.instance.admin.value.uid}');
        await NotificationService.instance
            .sendNotificationRequest(notification);

        // notify the user of successful operation
        CustomSnackBars.showSuccessSnackBar(
          title: 'Congrats!',
          message: 'pickup request sent, please wait for confirmation',
        );

        //remove the loader
        CustomOverlayLoader().stopLoader();

        //push to usernotificationsView
        Get.to(() => const UserRequestNotificationsView());
      });
    } catch (e) {
      CustomOverlayLoader().stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh snap', message: e.toString());
    } finally {
      CustomOverlayLoader().stopLoader();
    }
  }
}
