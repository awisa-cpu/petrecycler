import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back,
        leadingOnPressed: () => Get.back(),
        title: const Text('Notifications'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(message.notification!.title.toString()),
            Text(message.notification!.body.toString()),
            Text(message.data.toString()),
            Text(message.sentTime.toString()),
            Text(message.from.toString()),
            Text(message.messageId.toString()),
            Text(message.messageType.toString()),
            Text(message.senderId.toString()),
          ],
        ),
      ),
    ));
  }
}
