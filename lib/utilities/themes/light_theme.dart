import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/themes/custom_themes/checkbox_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/elevated_button_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/outlined_button_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/text_theme.dart';
import 'package:petrecycler/utilities/themes/custom_themes/textfield_theme.dart';

class LightTheme {
  //light theme
  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: CElevatedButtonTheme.lightElevatedBTheme,
        inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
        textTheme: CTextTheme.lightTextTheme,
        checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
        outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
      );

//dark theme
}
