import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/features/admin/admin_notifications_management/controllers/admin_notifications_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/controllers/user_notifications_controller.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/fcm_notification_model.dart';
import 'package:petrecycler/utilities/constants/request_url.dart';
import 'package:logger/logger.dart';

class NotificationService extends GetxController {
  static NotificationService get instance => Get.find();

  final firebaseMessenger = FirebaseMessaging.instance;
  final _db = FirebaseFirestore.instance;
  final _auth = Get.put(AuthRepository());

  Future<void> initNotifications() async {
    //request permission from user: inside the main
    await firebaseMessenger.requestPermission();

    //
    _initPushNotifications();
  }

  Future<void> fetchAndStoreInDb() async {
    //fetch the FCM token for this user device
    final userFcmToken = await firebaseMessenger.getToken();

    //this would normally be sent to the server
    if (userFcmToken != null) {
      _saveUserDeviceTokenToDb(userFcmToken);
    }
  }

  void onTokenRefresh() {
    //this is called in the App widget
    firebaseMessenger.onTokenRefresh.listen(
      (event) => _saveUserDeviceTokenToDb,
    );
  }

  //function to handle received messages
  void _handleIncomingMesage(RemoteMessage? message) {
    //if message is null, do nothing
    if (message == null) return;
    Logger().i(message.toMap());

    //check the message.data if the message is for admin or user
    String notificationType = message.data['notificationType'];

    if (notificationType == 'adminNotification') {
      final adminController = Get.put(AdminNotificationsController());
      adminController.handleAdminNotication(message);
    } else if (notificationType == 'userNotification') {
      final userNotiController = Get.put(UserNotificationsController());
      userNotiController.handleUserNotifications(message);
    }
  }

  // Future<void> _firebaseMessagingBackgroundHandler(
  //   RemoteMessage message,
  // ) async {
  //   //check the message.data if the message is for admin or user
  //   String notificationType = message.data['notificationType'];

  //   if (notificationType == 'adminNotification') {
  //     final adminController = Get.put(AdminNotificationsController());
  //     adminController.handleAdminNotication(message);
  //   } else if (notificationType == 'userNotification') {
  //     final userNotiController = Get.put(UserNotificationsController());
  //     userNotiController.handleUserNotifications(message);
  //   }
  // }

  ///function to initialize background settings
  Future<void> _initPushNotifications() async {
    //handle notifications if the app was terminated and now opened
    firebaseMessenger
        .getInitialMessage()
        .then((message) => _handleIncomingMesage(message));

    // Handle notification taps when the app is in the background or terminated
    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _handleIncomingMesage(message));

    //handle notifications when the app is in foreground
    FirebaseMessaging.onMessage
        .listen((message) => _handleIncomingMesage(message));

    //handle notifications when the app is in background or terminated
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

//save device token to db
  void _saveUserDeviceTokenToDb(String token) async {
    try {
      await _db.collection('UserDeviceTokens').doc(_auth.authUser!.uid).set(
        {'token': token, 'dateTime': DateTime.now().toString()},
      );
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

//send notification to admin
  Future<void> sendNotificationRequest(
      FcmNotificationModel notification) async {
    try {
      Logger().i(notification.toJson());

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: notification.toJson(),
      );

      Logger().i('Response Body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to send notification. Status code: ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      Logger().e('Failed to send notification', error: e);
      throw Exception('Request Timed out');
    } on SocketException catch (e) {
      Logger().e('Could not conect', error: e);
      throw Exception("Error connecting to the network");
    } catch (e) {
      Logger().e('Error message: ', error: e);
      throw Exception('something went wrong');
    }
  }
}
