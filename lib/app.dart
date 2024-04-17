import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/bindings/general_bindings.dart';
import 'package:petrecycler/data/services/notification_service/notification_service.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/themes/light_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    NotificationService.instance.onTokenRefresh();
  }

  //
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Recycler',
      theme: LightTheme.lightTheme,
        initialBinding: GeneralBindings(),
      home: const PageInit(),
    );
  }
}

class PageInit extends StatelessWidget {
  const PageInit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: CColors.mainColor,
        ),
      ),
    );
  }
}
