import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/data/services/notification_service/notification_service.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/fcm_notification_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/utilities/formatters/input_formatters.dart';
import 'package:petrecycler/utilities/loaders/overlay_loading_screen.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class AdminReplyController extends GetxController {
  static AdminReplyController get instance => Get.find();

  //variables
  final GlobalKey<FormState> replyFommKey = GlobalKey<FormState>();
  final GlobalKey<FormState> adminDeclineKey = GlobalKey<FormState>();
  final rejectionReason = TextEditingController();
  final dopController = TextEditingController();
  final topController = TextEditingController();
  var selectedDate = DateTime.now();
  final adminReplyDate = ''.obs;
  TimeOfDay? currentTime = TimeOfDay.now();
  final adminReplyTime = ''.obs;

  @override
  void onClose() {
    super.onClose();
    rejectionReason.dispose();
    dopController.dispose();
    topController.dispose();
  }

  void selectDateOfPickup() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      final value = CFormatters.formatDate(selectedDate.toString());
      adminReplyDate.value = value;
      dopController.text = adminReplyDate.value;
    }
  }

  void selectTimeOfPickup() async {
    final pickedTime = await showTimePicker(
        context: Get.context!, initialTime: TimeOfDay.now());

    if (pickedTime != null && pickedTime != currentTime) {
      currentTime = pickedTime;
      adminReplyTime.value = currentTime!.format(Get.context!);
      topController.text = adminReplyTime.value;
    }
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
      if (replyFommKey.currentState?.validate() != true) {
        CustomOverlayLoader().stopLoader();
        return;
      }
      Logger().i('This function got here');

      //update the pending request
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

        final notification = FcmNotificationModel(
          userId: request.senderId,
          title: "New notification",
          body: "update on ${request.uid} request",
          data: FcmData(
            notificationType: 'userNotification',
            dop: adminReplyDate.value.trim(),
            top: adminReplyTime.value.trim(),
            declineReason: rejectionReason.text.trim(),
          ),
        );

        await NotificationService.instance
            .sendNotificationRequest(notification);

        CustomOverlayLoader().stopLoader();

        CustomSnackBars.showSuccessSnackBar(
            title: 'Reply sent', message: 'request has been updated');
      });

      //inform the user with the pickup date and time and other relevant details
    } on TimeoutException catch (e) {
      Logger().i(e);
      CustomOverlayLoader().stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: "Oh snap", message: "Time out, pls try again");
    } on SocketException catch (e) {
      Logger().i(e);
      CustomOverlayLoader().stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: "Oh snap", message: "Error sending reply, pls try again");
    } catch (e) {
      Logger().i(e);
      CustomOverlayLoader().stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: "Oh snap", message: "Reply couldnt be completed, try again");
    }
  }
}
