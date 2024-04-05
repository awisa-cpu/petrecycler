import 'package:flutter/material.dart';

class CAppBarTheme {
  CAppBarTheme._();

  //
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: 0.0,
    centerTitle: false,
    scrolledUnderElevation: 0.0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.0),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  //
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0.0,
    centerTitle: false,
    scrolledUnderElevation: 0.0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.0),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
