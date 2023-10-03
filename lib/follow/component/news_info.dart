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
        child: Text(name + " " + changePercent.toString() + "%",
            style: TextStyle(
                fontSize: 12.sp,
                color: changePercent == 0
                    ? Colors.yellow[200]
                    : (changePercent > 0 ? Colors.green[300] : Colors.red[200]),
                fontWeight: FontWeight.w400)),
        decoration: BoxDecoration(
          color: changePercent == 0
              ? Colors.yellow[800]
              : (changePercent > 0 ? Colors.green[800] : Colors.red[800]),
          borderRadius: BorderRadius.circular(50),
        ));
  }
}
