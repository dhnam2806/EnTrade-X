// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceColorRangeGreen extends StatelessWidget {
  String whiteNum;
  String redNum;
  double greenRange;

  PriceColorRangeGreen({
    required this.whiteNum,
    required this.redNum,
    required this.greenRange,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size / 2;
    double sizeWidth = size.width * greenRange;
    double padding = 4.w;
    return Container(
      width: size.width - padding,
      margin: EdgeInsets.only(left: 4.w),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey[800]!),
        top: BorderSide(color: Colors.grey[800]!),
      )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                width: size.width - sizeWidth - padding / 2,
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 43, 98, 45),
                ),
                width: sizeWidth - padding / 2,
                height: 20.h,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 16.w, left: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  whiteNum,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  redNum,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
