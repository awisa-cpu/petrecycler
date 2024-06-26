import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._();

  //light elevated button theme
  static ElevatedButtonThemeData lightElevatedBTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    enableFeedback: false,
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: CColors.mainColor,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: CColors.mainColor),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ));

  //
  //dark elevated button theme
  static ElevatedButtonThemeData darkElevatedBTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: Colors.blue),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
