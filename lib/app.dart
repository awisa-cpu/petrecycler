import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Recycler',
      theme: LightTheme.lightTheme,
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
