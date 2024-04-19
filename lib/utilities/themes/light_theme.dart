import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/themes/custom_themes/checkbox_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/elevated_button_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/outlined_button_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/text_button_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/text_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/textfield_theme.dart';

class LightTheme {
  //light theme
  static ThemeData get lightTheme => ThemeData(
        datePickerTheme: const DatePickerThemeData(
          headerForegroundColor: CColors.mainColor,
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        elevatedButtonTheme: CElevatedButtonTheme.lightElevatedBTheme,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: CColors.mainColor),
        inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
        textTheme: CTextTheme.lightTextTheme,
        textButtonTheme: CTextButtonTheme.lightTextButtonTheme,
        checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
        outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
      );

//dark theme
}
