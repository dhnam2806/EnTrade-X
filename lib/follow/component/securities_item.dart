// ignore_for_file: must_be_immutable

import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecuritiesItem extends StatelessWidget {
  String name;
  double price;
  double change;
  double changePercent;

  SecuritiesItem({
    required this.name,
    required this.price,
    required this.change,
    required this.changePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Text(
              name.toUpperCase(),
              style: AppTextStyle.bodySmall_14
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 8.w),
            Text(price.toString(),
                style: AppTextStyle.bodyLarge_16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: changePercent > 0 ? AppColors.green : AppColors.green,
                )),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          (changePercent > 0 ? "+" : "-") + "$change  ($changePercent%)",
          style: AppTextStyle.bodySmall_14.copyWith(
            fontWeight: FontWeight.w400,
            color: changePercent > 0 ? AppColors.green : AppColors.red,
          ),
        ),
      ]),
    );
  }
}
