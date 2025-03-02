import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/features/admin/admin_navigation/admin_navigation_menu.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/views/admin_request_manager_view.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/views/widgets/custom_request_decline_form.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';
import '../views/widgets/custom_accept_requests_details.dart';
import '../views/widgets/custom_show_requests_details.dart';

class AdminNotificationsController extends GetxController {
  static AdminNotificationsController get instance => Get.find();

  final RxInt unreadPendingRequestNotifications = 0.obs;
  var adminRequestsNotifications = <RemoteMessage>[].obs;
  var pendingRequests = <RequestModel>[].obs;
  var acceptedRequests = <RequestModel>[].obs;
  var completedRequests = <RequestModel>[].obs;
  var declinedRequests = <RequestModel>[].obs;
  final CollectionReference pickupRequests =
      FirebaseFirestore.instance.collection('Requests');

  late final StreamSubscription<QuerySnapshot> pickupRequestsSubscription;

  //

  @override
  void onInit() {
    super.onInit();
    pickupRequestsSubscription =
        pickupRequests.snapshots().listen(streamRequestHandler);
  }

  void handleAdminNotication(RemoteMessage adminMessage) {
    //handle when app state is in foreground
    _foregroundMessesgaeHandler(adminMessage);

    //handle when app state is in background and admin taps on the message
    _onAdminTapNotificationMessage(adminMessage);
  }

  void _foregroundMessesgaeHandler(RemoteMessage? message) {
    if (message == null) {
      return;
    } else {
      CustomSnackBars.showInforSnackBar(
        title: 'New Request',
        message: 'Notification',
        showOnTap: true,
        onPressed: () => Get.to(() => const AdminRequestManager()),
      );
      // Add the new notification to the notifications list

      if (!adminRequestsNotifications.contains(message)) {
        adminRequestsNotifications.insert(0, message);
        // Increment the unread notification count
        unreadPendingRequestNotifications.value++;
      }
    }
  }

  void _onAdminTapNotificationMessage(RemoteMessage? message) {
    if (message == null) return;

    //navigate user to home
    Get.to(() => const AdminNavigationMenu());

    // Add the new notification to the notifications list
    if (!adminRequestsNotifications.contains(message)) {
      adminRequestsNotifications.insert(0, message);

      // Increment the unread notification count
      unreadPendingRequestNotifications.value++;
    }
  }

  void markAsRead(RequestModel request) {
    request.readStatus = true;
  }

  // Update local list based on the new status
  void updateLocalList(RequestModel request, String newStatus) {
    if (newStatus == 'accepted') {
      int index =
          pendingRequests.indexWhere((element) => element.uid == request.uid);
      pendingRequests.removeAt(index);
      acceptedRequests.insert(index, request);
    } else if (newStatus == 'declined') {
      int index =
          pendingRequests.indexWhere((element) => element.uid == request.uid);
      pendingRequests.removeAt(index);
      declinedRequests.insert(index, request);
    } else if (newStatus == 'completed') {
      int index =
          acceptedRequests.indexWhere((element) => element.uid == request.uid);
      acceptedRequests.removeAt(index);
      completedRequests.insert(index, request);
    }
  }

  void streamRequestHandler(QuerySnapshot snapshot) {
    // snapshot.
    final documents =
        snapshot.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
    final allRequests =
        documents.map((e) => RequestModel.fromDBSnapshot(e)).toList();

    // Update local lists based on the status of each request
    pendingRequests.assignAll(
        allRequests.where((request) => request.status == 'pending').toList());
    acceptedRequests.assignAll(
        allRequests.where((request) => request.status == 'accepted').toList());
    declinedRequests.assignAll(
        allRequests.where((request) => request.status == 'declined').toList());
    completedRequests.assignAll(
        allRequests.where((request) => request.status == 'completed').toList());
  }

  void showRequestPendingInfoDialog(RequestModel request) async {
    await showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: Get.context!,
      builder: (_) => CustomShowRequestsDetails(
        request: request,
      ),
    );
  }

  void showRequestAcceptedInfoDialog(RequestModel request) async {
    await showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: Get.context!,
      builder: (_) => CustomAcceptRequestsDetails(
        request: request,
      ),
    );
  }

  void declineUserRequest(RequestModel request) async {
    //
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Decline Response'),
          content: const Text('Are you sure you want to decline?'),
          actions: [
            CustomEButton(
                onPressed: () {
                  Navigator.pop(Get.context!);
                  Get.to(()=>CustomDeclineRequestForm(request: request));
                },
                text: 'Yes',
                addIcon: false),
            const SizedBox(height: CSizes.md),
            CustomEButton(
              onPressed: () => Navigator.of(context).pop(),
              text: 'No',
              addIcon: false,
            ),
          ],
        );
      },
    );
  }

  Color getColorBasedOnStatus(String status) {
    switch (status) {
      case 'pending':
        return CColors.mainColor;
      case 'accepted':
        return CColors.warning;
      case 'completed':
        return CColors.success;
      case "declined":
        return CColors.error;

      default:
        return CColors.mainColor;
    }
  }

  @override
  void onClose() {
    super.onClose();
    pickupRequestsSubscription.cancel();
  }
}
