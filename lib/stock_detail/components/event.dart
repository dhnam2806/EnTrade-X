import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 56.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 13, 76),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "24",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.purple[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "8/2023",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[300],
                        ),
                      ),
                    ]),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trả cổ tức bằng tiền mặt",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Trả cổ tức đợt 1/2023 bằng tiền, 1,000 đồng/CP",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Thực hiện: ",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "12/09/2023",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                width: 56.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 13, 76),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.purple[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "7/2023",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[300],
                        ),
                      ),
                    ]),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trả cổ tức bằng tiền mặt",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Trả cổ tức đợt 2/2023 bằng tiền, 1,000 đồng/CP",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Thực hiện: ",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "13/09/2023",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                width: 56.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 13, 76),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.purple[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "7/2023",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[300],
                        ),
                      ),
                    ]),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trả cổ tức bằng cổ phiếu",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Trả cổ tức năm 2022 bằng cổ phiếu tỷ lệ 20:3",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    // RichText(
                    //   text: TextSpan(
                    //       text: "Thực hiện: ",
                    //       style: TextStyle(color: Colors.grey),
                    //       children: [
                    //         TextSpan(
                    //           text: "12/09/2023",
                    //           style: TextStyle(color: Colors.white),
                    //         )
                    //       ]),
                    // ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 8.h),
          Text("Xem thêm",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14.sp,
              )),
        ],
      ),
    );
  }
}
