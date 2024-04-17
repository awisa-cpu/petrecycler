import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/features/user/user_navigation/user_navigation_menu.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/notification_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/user_notifications_view.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

import '../views/widgets/custom_user_notification.dart';

class UserNotificationsController extends GetxController {
  static UserNotificationsController get instance => Get.find();

  final RxInt unreadNotificationCount = 0.obs;
  var notifications = <NotificationModel>[].obs;
  final _storage = GetStorage();
  //
  var pendingRequests = <RequestModel>[].obs;
  var acceptedRequests = <RequestModel>[].obs;
  var completedRequests = <RequestModel>[].obs;
  var declinedRequests = <RequestModel>[].obs;

//
  final firebaseMessenger = FirebaseMessaging.instance;
  final CollectionReference requests =
      FirebaseFirestore.instance.collection('Requests');
  late final StreamSubscription<QuerySnapshot> pickupRequestsSubscription;

  @override
  void onInit() {
    super.onInit();
    pickupRequestsSubscription = requests
        .where("senderId", isEqualTo: AuthRepository.instance.authUser!.uid)
        .snapshots()
        .listen(streamRequestHandler);
    notifications.assignAll(
      _storage
              .read<List>('notifications')
              ?.map((e) => NotificationModel.fromMap(e))
              .toList() ??
          [],
    );
    unreadNotificationCount.value =
        _storage.read<int>('unreadNotificationCount') ?? 0;
  }

  void handleUserNotifications(RemoteMessage userMessage) {
    //handle when app state is in foreground
    _foregroundMessesgaeHandler(userMessage);

    //handle when app state is in background and user taps on the message
    _onUserTapNotificationMessage(userMessage);
  }

  void _foregroundMessesgaeHandler(RemoteMessage? message) {
    if (message == null) {
      return;
    } else {
      CustomSnackBars.showInforSnackBar(
          title: 'New Request',
          message: 'Notification',
          showOnTap: true,
          onPressed: () => Get.to(() => const UserNotificationsView()));
      // Add the new notification to the notifications list
      final notification = NotificationModel.fromRemoteMessage(message);

      //add it if it hasn;t been added before
      if (!notifications.contains(notification)) {
        notifications.insert(0, notification);
        // Increment the unread notification count
        unreadNotificationCount.value++;

        // Save notifications list and unreadNotificationCount to storage
        _storage.write(
            'notifications', notifications.map((e) => e.toMap()).toList());
        _storage.write(
            'unreadNotificationCount', unreadNotificationCount.value);
      }
    }
  }

  void _onUserTapNotificationMessage(RemoteMessage? message) {
    if (message == null) return;

    //navigate user to home
    Get.to(() => const UserNavigationMenu());

    // Add the new notification to the notifications list
    final notification = NotificationModel.fromRemoteMessage(message);
    final existingNotificationIndex =
        notifications.indexWhere((n) => n == notification);
    if (existingNotificationIndex != -1) {
      notifications[existingNotificationIndex].readStatus = true;
      // Decrement the unread notification count if it's not already 0
      if (unreadNotificationCount.value > 0) {
        unreadNotificationCount.value--;
      }

      // Save notifications list and unreadNotificationCount to storage
      _storage.write(
          'notifications', notifications.map((e) => e.toMap()).toList());
      _storage.write('unreadNotificationCount', unreadNotificationCount.value);
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

  void markAsRead(NotificationModel notification) {
    notification.readStatus = true;
    if (unreadNotificationCount.value != 0) {
      _storage.write(
          'unreadNotificationCount', --unreadNotificationCount.value);
    }
    _storage.write(
        'notifications', notifications.map((e) => e.toMap()).toList());
  }

  void markAllAsRead() {
    for (var notification in notifications) {
      notification.readStatus = true;
    }
    _storage.write(
        'notifications', notifications.map((e) => e.toMap()).toList());
    unreadNotificationCount.value = 0;
    _storage.write('unreadNotificationCount', 0);
  }

  void showDialogOfNotification(NotificationModel notification) async {
    await showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: Get.context!,
      builder: (_) => CustomUserNotification(
        notification: notification,
      ),
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
}
