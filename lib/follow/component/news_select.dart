// ignore_for_file: must_be_immutable

import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsSelect extends StatelessWidget {
  String title;
  bool isSelected = false;
  NewsSelect({
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: 80.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(title,
            style: AppTextStyle.bodySmall_14.copyWith(
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? AppColors.white
                  : Theme.of(context).textTheme.bodyMedium!.color,
            )),
      ),
    );
  }
}
