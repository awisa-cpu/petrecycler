import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/utilities/loaders/overlay_loading_screen.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class AdminReplyController extends GetxController {
  static AdminReplyController get instance => Get.find();

  //variables
  final GlobalKey<FormState> replyFommKey = GlobalKey<FormState>();
  late final TextEditingController scheduleReplyDate;
  late final TextEditingController scheduleReplyTime;
  var selectedDate = DateTime.now();

  void pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  @override
  void onInit() {
    super.onInit();
    scheduleReplyDate = TextEditingController();
    scheduleReplyTime = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    scheduleReplyDate.clear();
    scheduleReplyTime.clear();
  }

  //methods
  void adminReplyToRequest(RequestModel request, String newStatus) async {
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
      if (replyFommKey.currentState != null) {
        if (!replyFommKey.currentState!.validate()) {
          CustomOverlayLoader().stopLoader();
          return;
        }
      }

      FirebaseFirestore.instance
          .collection("Requests")
          .doc(request.uid)
          .update({"status": newStatus});

      AdminNotificationsController.instance.updateLocalList(request, newStatus);

      CustomOverlayLoader().stopLoader();
      Navigator.pop(Get.context!);

      CustomSnackBars.showSuccessSnackBar(
          title: 'Reply sent', message: 'request has been updated');

/*
      //update the pening request
      FirebaseFirestore.instance.runTransaction((transaction) async {
        final fetchedRequest =
            FirebaseFirestore.instance.collection("Requests").doc(request.uid);
        transaction.update(fetchedRequest, {
          "status": newStatus,
        });

        //update local list
        AdminNotificationsController.instance
            .updateLocalList(request, newStatus);

        //call the method to send request to the user
        // add the deatisl of the reply from admin
        await NotificationService.instance.sendNotificationRequest(
          userId: request.senderId,
          title: 'New request',
          body: 'update on ${request.uid} request',
          data: {
            'notificationType': 'userNotification',
            'dop' : scheduleReplyDate.text.trim(),
            'top' :scheduleReplyTime.text.trim()
            },
        );
      });
*/
      //inform the user with the pickup date and time and other relevant details
    } catch (e) {
      CustomOverlayLoader().stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: "Oh snap", message: "Reply couldnt be completed, try again");
    }
  }
}
