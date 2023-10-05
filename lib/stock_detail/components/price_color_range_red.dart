// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceColorRangeRed extends StatelessWidget {
  String whiteNum;
  String redNum;
  double redRange;

  PriceColorRangeRed({
    required this.whiteNum,
    required this.redNum,
    required this.redRange,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size / 2;
    double sizeWidth = size.width * redRange;
    double padding = 4.w;
    return Container(
      width: size.width - padding,
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
                color: Color.fromARGB(255, 110, 17, 17),
                width: sizeWidth - padding / 2,
                height: 20.h,
              ),
              Container(
                color: Theme.of(context).colorScheme.background,
                width: size.width - sizeWidth - padding / 2,
                height: 20.h,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  redNum,
                  style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  whiteNum,
                  style: TextStyle(
                    color: Colors.white,
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
