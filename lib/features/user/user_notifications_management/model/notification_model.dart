import 'package:firebase_messaging/firebase_messaging.dart';

///these are the fields of interest
// message.sentTime
// message.notification.body(User xyz has requested a pickup)
// message.notification.title(New Pickup request)
/* message.data{
 'requestId':'request_id" 
}
*/ 


class NotificationModel {
  final RemoteMessage message;
  bool readStatus;

  NotificationModel({
    required this.message,
    this.readStatus = false,
  });

  factory NotificationModel.fromRemoteMessage(RemoteMessage message) {
    return NotificationModel(message: message);
  }

  Map<String, dynamic> toMap() {
    return {
      'message': {
        'data': message.data,
        'notification': {
          'title': message.notification?.title,
          'body': message.notification?.body,
        },
      },
      'readStatus': readStatus,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      message: RemoteMessage(
        data: Map<String, String>.from(map['message']['data'] ?? {}),
        notification: RemoteNotification(
          title: map['message']['notification']['title'] ?? '',
          body: map['message']['notification']['body'] ?? '',
        ),
      ),
      readStatus: map['readStatus'] ?? false,
    );
  }
}
