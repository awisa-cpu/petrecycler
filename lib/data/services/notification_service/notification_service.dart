import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService extends GetxController {
  static NotificationService get instance => Get.find();

  final firebaseMessenger = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    //request permission from user
    await firebaseMessenger.requestPermission();

    //fetch the FCM token for this user device
    final userFcmToken = await firebaseMessenger.getToken();

    //this would normally be sent to the server: but lets print
    log('Token: $userFcmToken');

    //
    initPushNotifications();
  }

  //fucntion to handle received messages
  void _handleIncomingMesage(RemoteMessage? message) {
    //if message is null, do nothin
    if (message == null) return;

    //check the message.data if the message is for admin or user
    // String notificationType = message.data['notificationType'];..

    // if (notificationType == 'adminNotification') {..
    // Show the notification in the admin interface
    // Example: adminProvider.showNotification(message);
    // } else if (notificationType == 'userNotification') {..
    // Show the notification in the user interface
    // Example: userProvider.showNotification(message);
    // }..

    //navigate to a new screen when message is received and user taps notifications
    log('Remote Message: ${message.toMap()}');
    // Get.to(() => const NotificationView(), arguments: message);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    //Process the message as needed.
    log('Remote Message: $message');
  }

  //function to initialize background settings
  Future<void> initPushNotifications() async {
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
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}
