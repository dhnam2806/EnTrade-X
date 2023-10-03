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
        color:
            isSelected ? Colors.red : Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(title,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSecondary)),
      ),
    );
  }
}
