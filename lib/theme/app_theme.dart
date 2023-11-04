import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

const _lightTextColor = AppColors.black;
const _darkTextColor = Colors.white;

final TextTheme lightTextTheme = TextTheme(
  headlineLarge: AppTextStyle.headlineLarge_32.copyWith(color: _lightTextColor),
  headlineMedium:
      AppTextStyle.headlineMedium_24.copyWith(color: _lightTextColor),
  headlineSmall: AppTextStyle.headlineSmall_20.copyWith(color: _lightTextColor),
  titleLarge: AppTextStyle.titleLarge_22.copyWith(color: _lightTextColor),
  titleMedium: AppTextStyle.titleMedium_16.copyWith(color: _lightTextColor),
  titleSmall: AppTextStyle.titleSmall_14.copyWith(color: _lightTextColor),
  bodyLarge: AppTextStyle.bodyLarge_16.copyWith(color: _lightTextColor),
  bodyMedium: AppTextStyle.bodyMedium_15.copyWith(color: _lightTextColor),
  bodySmall: AppTextStyle.bodySmall_14.copyWith(color: _lightTextColor),
  labelLarge: AppTextStyle.labelLarge_18.copyWith(color: _lightTextColor),
  labelMedium: AppTextStyle.labelMedium_16.copyWith(color: _lightTextColor),
  labelSmall: AppTextStyle.labelSmall_14.copyWith(color: _lightTextColor),
);

final TextTheme darkTextTheme = TextTheme(
  headlineLarge: AppTextStyle.headlineLarge_32.copyWith(color: _darkTextColor),
  headlineMedium:
      AppTextStyle.headlineMedium_24.copyWith(color: _darkTextColor),
  headlineSmall: AppTextStyle.headlineSmall_20.copyWith(color: _darkTextColor),
  titleLarge: AppTextStyle.titleLarge_22.copyWith(color: _darkTextColor),
  titleMedium: AppTextStyle.titleMedium_16.copyWith(color: _darkTextColor),
  titleSmall: AppTextStyle.titleSmall_14.copyWith(color: _darkTextColor),
  bodyLarge: AppTextStyle.bodyLarge_16.copyWith(color: _darkTextColor),
  bodyMedium: AppTextStyle.bodyMedium_15.copyWith(color: _darkTextColor),
  bodySmall: AppTextStyle.bodySmall_14.copyWith(color: _darkTextColor),
  labelLarge: AppTextStyle.labelLarge_18.copyWith(color: _darkTextColor),
  labelMedium: AppTextStyle.labelMedium_16.copyWith(color: _darkTextColor),
  labelSmall: AppTextStyle.labelSmall_14.copyWith(color: _darkTextColor),
);

///================ Color Scheme ===================

ColorScheme _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary_01,
  onPrimary: Colors.white,
  secondary: AppColors.black,
  onSecondary: Colors.white,
  error: AppColors.red,
  onError: Colors.white,
  background: AppColors.light_bg_02,
  onBackground: AppColors.light_bg_03,
  surface: AppColors.gray,
  onSurface: Colors.grey,
);
ColorScheme _darkColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary_02,
  onPrimary: AppColors.black,
  secondary: AppColors.white,
  onSecondary: Colors.white,
  error: AppColors.red,
  onError: Colors.white,
  background: AppColors.dark_bg_02,
  onBackground: AppColors.dark_bg_03,
  surface: AppColors.gray,
  onSurface: Colors.grey,
);

final AppBarTheme _lightAppBarTheme = AppBarTheme(
  elevation: 0.0,
  titleSpacing: 16.0,
  backgroundColor: AppColors.light_bg_01,
  foregroundColor: AppColors.black,
  centerTitle: false,
  titleTextStyle: AppTextStyle.headlineSmall_20.copyWith(
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  ),
);

final AppBarTheme _darkAppBarTheme = AppBarTheme(
  elevation: 0.0,
  titleSpacing: 16.0,
  backgroundColor: AppColors.dark_bg_01,
  foregroundColor: AppColors.white,
  centerTitle: false,
  titleTextStyle: AppTextStyle.headlineSmall_20.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  ),
);

///================ THEME DATA ===================

final ThemeData lightThemeData = ThemeData(
  scaffoldBackgroundColor: AppColors.light_bg_01,
  textTheme: lightTextTheme,
  colorScheme: _lightColorScheme,
  appBarTheme: _lightAppBarTheme,
);

final ThemeData darkThemeData = ThemeData(
  scaffoldBackgroundColor: AppColors.dark_bg_01,
  textTheme: darkTextTheme,
  colorScheme: _darkColorScheme,
  appBarTheme: _darkAppBarTheme,
);
