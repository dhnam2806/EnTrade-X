import 'package:flutter/material.dart';

class NAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 245, 240, 240),
    scaffoldBackgroundColor: Color.fromARGB(255, 239, 232, 232),
    colorScheme: ColorScheme(
      primary: Color.fromARGB(255, 167, 38, 38),
      secondary: Color.fromARGB(255, 255, 255, 255),
      surface: Colors.grey,
      background: Color.fromARGB(255, 255, 255, 255),
      error: Color.fromARGB(255, 255, 255, 255),
      onPrimary: Color.fromARGB(255, 240, 239, 239),
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 255, 255, 255),
      onError: Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromARGB(255, 28, 28, 28),
    scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
    appBarTheme: AppBarTheme(
      color: Color.fromARGB(255, 28, 28, 28),
    ),
    colorScheme: ColorScheme(
      primary: Color.fromARGB(255, 167, 38, 38),
      secondary: Color.fromARGB(255, 255, 255, 255),
      surface: Colors.grey,
      background: Color.fromARGB(255, 31, 30, 30),
      error: Color.fromARGB(255, 255, 255, 255),
      onPrimary: Color.fromARGB(255, 29, 29, 29),
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 255, 255, 255),
      onError: Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.dark,
    ),
  );
}
