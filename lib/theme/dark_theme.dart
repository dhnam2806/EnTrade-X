import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  iconTheme: IconThemeData(color: Colors.red),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.red),
    color: Colors.black,
    elevation: 0,
    toolbarTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).bodyMedium,
    titleTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).titleLarge,
  ),
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
      secondary: Colors.grey[900],
      tertiary: Colors.grey,
      background: Colors.black,
      brightness: Brightness.dark),
);
