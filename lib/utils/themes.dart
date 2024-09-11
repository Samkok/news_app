import 'package:flutter/material.dart';

import 'color_const.dart';

class Themes {

  // Light theme customizations
  final ThemeData lightTheme = ThemeData(
      primaryColor: ColorConst.mainColor, // Custom primary color
      hintColor: ColorConst.backgroundLight, // Custom background color
      brightness: Brightness.light,
      hoverColor: ColorConst.g200,
      dividerColor: ColorConst.g300,
      textTheme: TextTheme(
        labelLarge: TextStyle(
            color: ColorConst.g900,
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),
        bodyLarge: TextStyle(
            color: ColorConst.g900,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        bodyMedium: TextStyle(
            color: ColorConst.g800,
            fontSize: 15,
        ),
        bodySmall: TextStyle(
            color: ColorConst.g900,
            fontSize: 12,
        ),
      ),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorConst.mainColor,
          onPrimary: ColorConst.g900,
          secondary: ColorConst.mainColor.withOpacity(0),
          onSecondary: ColorConst.mainColor.withOpacity(0),
          error: ColorConst.error,
          onError: ColorConst.error,
          surface: ColorConst.background,
          onSurface: ColorConst.background
      )
  );

  // Dark theme customizations
  final ThemeData darkTheme = ThemeData(
      primaryColor: ColorConst.mainColor,         // Custom primary color
      hintColor: ColorConst.background,     // Custom background color
      brightness: Brightness.dark,      // dark mode
      dividerColor: ColorConst.g100,
      hoverColor: ColorConst.g800,
      textTheme: TextTheme(
        labelLarge: TextStyle(
            color: ColorConst.g100,
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),
        bodyLarge: TextStyle(
            color: ColorConst.g100,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        bodyMedium: TextStyle(
          color: ColorConst.g100,
          fontSize: 15,
        ),
        bodySmall: TextStyle(
          color: ColorConst.g100,
          fontSize: 12,
        ),
      ),
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: ColorConst.mainColor,
          onPrimary: ColorConst.g100,
          secondary: ColorConst.mainColor.withOpacity(0),
          onSecondary: ColorConst.mainColor.withOpacity(0),
          error: ColorConst.error,
          onError: ColorConst.error,
          surface: ColorConst.background,
          onSurface: ColorConst.background
      )
  );

}