import 'package:entradex/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const _defaulTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
  );

  static final headlineLarge_32 = _defaulTextStyle.copyWith(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
  );
  static final headlineMedium_24 = _defaulTextStyle.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static final headlineSmall_20 = _defaulTextStyle.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  static final titleLarge_22 = _defaulTextStyle.copyWith(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
  );
  static final titleMedium_16 = _defaulTextStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static final titleSmall_14 = _defaulTextStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static final bodyLarge_16 = _defaulTextStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final bodyMedium_15 = _defaulTextStyle.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
  static final bodySmall_14 = _defaulTextStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
    static final bodySmall_13 = _defaulTextStyle.copyWith(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );
  static final labelLarge_18 = _defaulTextStyle.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static final titleLarge_18 = _defaulTextStyle.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
  static final labelMedium_16 = _defaulTextStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static final labelSmall_14 = _defaulTextStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static final labelSmall_12 = _defaulTextStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static final textButtonTextStyle = _defaulTextStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );

  static final bottomNavLabel = _defaulTextStyle.copyWith(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
  );

  static final inputErrorText = _defaulTextStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.redText,
  );
}
