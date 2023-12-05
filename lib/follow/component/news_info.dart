// ignore_for_file: must_be_immutable

import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsInfo extends StatelessWidget {
  String name;
  double changePercent;
  NewsInfo({
    required this.name,
    required this.changePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
        child: Text(
          name + " " + changePercent.toString() + "%",
          style: AppTextStyle.labelSmall_12.copyWith(
            fontWeight: FontWeight.w500,
            color: changePercent == 0
                ? AppColors.yellow
                : (changePercent > 0 ? AppColors.green : AppColors.red),
          ),
        ),
        decoration: BoxDecoration(
          color: changePercent == 0
              ? AppColors.yellow.withOpacity(0.3)
              : (changePercent > 0
                  ? AppColors.green.withOpacity(0.3)
                  : AppColors.red.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(50),
        ));
  }
}
