import 'package:entradex/stock_detail/components/price_color_range_green.dart';
import 'package:entradex/stock_detail/components/price_color_range_red.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceStep extends StatefulWidget {
  const PriceStep({super.key});

  @override
  State<PriceStep> createState() => _PriceStepState();
}

class _PriceStepState extends State<PriceStep> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                children: [
                  PriceColorRangeGreen(
                    whiteNum: '4,90',
                    redNum: '91.50',
                    greenRange: 0.8,
                  ),
                  PriceColorRangeGreen(
                    whiteNum: '10',
                    redNum: '91.40',
                    greenRange: 0.05,
                  ),
                  PriceColorRangeGreen(
                    whiteNum: '2,60',
                    redNum: '91.30',
                    greenRange: 0.3,
                  ),
                ],
              ),
              Column(
                children: [
                  PriceColorRangeRed(
                    whiteNum: '4,00',
                    redNum: '91.90',
                    redRange: 0.1,
                  ),
                  PriceColorRangeRed(
                    whiteNum: '34,00',
                    redNum: '92.00',
                    redRange: 0.55,
                  ),
                  PriceColorRangeRed(
                    whiteNum: '18,80',
                    redNum: '92.10',
                    redRange: 0.3,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            height: 4.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.12 - 4.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                ),
                Container(
                  width: size.width - (size.width * 0.12) - 4.w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Dư mua ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ),
                    children: [
                      TextSpan(
                        text: '7.6K',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Dư bán ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ),
                    children: [
                      TextSpan(
                        text: '56.8K',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey[800]!,
                ),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sàn",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Thấp",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "85.80",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "91.30",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TC",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "TB",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "92.20",
                            style: TextStyle(
                              color: Colors.yellow[700],
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "91.31",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trần",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Cao",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "98.60",
                            style: TextStyle(
                              color: Colors.purple[400],
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "91.60",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ]),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'NN mua ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                        ),
                        children: [
                          TextSpan(
                            text: '118K',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(" | ",
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp)),
                    RichText(
                      text: TextSpan(
                        text: 'NN bán ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                        ),
                        children: [
                          TextSpan(
                            text: '0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                RichText(
                    text: TextSpan(
                  text: 'Dư NN ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                  children: [
                    TextSpan(
                      text: '0',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
