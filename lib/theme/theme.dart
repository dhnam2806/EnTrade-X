import 'package:entradex/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 245, 240, 240),
    scaffoldBackgroundColor: Color.fromARGB(255, 239, 232, 232),
    colorScheme: ColorScheme(
      primary: AppColors.primary_01,
      secondary: Color.fromARGB(255, 255, 255, 255),
      surface: Colors.grey,
      background: Color.fromARGB(255, 245, 242, 242),
      error: Color.fromARGB(255, 255, 255, 255),
      onPrimary: Color.fromARGB(255, 240, 239, 239),
      onSecondary: Color.fromARGB(255, 0, 0, 0),
      onSurface: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 246, 245, 245),
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
      background: Color.fromARGB(255, 37, 37, 37),
      error: Color.fromARGB(255, 255, 255, 255),
      onPrimary: Color.fromARGB(255, 29, 29, 29),
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 44, 43, 43),
      onError: Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.dark,
    ),
  );
}
