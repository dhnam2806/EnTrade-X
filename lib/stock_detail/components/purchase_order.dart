import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({super.key});

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 200.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Sức mua: ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                      ),
                      children: [
                    TextSpan(
                      text: "0",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    )
                  ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Lệnh điều kiện",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.settings,
                    size: 24.sp,
                    color: Colors.red,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Text(
                  "LO",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                )),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Text(
                  "MP",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                )),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Text(
                  "ATC",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                )),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 105, 105, 105),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove),
                    Container(
                        width: 80.w,
                        child: Center(
                            child: Text(
                          "Giá đặt",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16.sp,
                          ),
                        ))),
                    Icon(Icons.add),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Giá khớp",
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 105, 105, 105),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove),
                    Container(
                        width: 80.w,
                        child: Center(
                            child: Text(
                          "Khối lượng",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16.sp,
                          ),
                        ))),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                width: MediaQuery.of(context).size.width / 2 - 16.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "MUA",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "(-)",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                width: MediaQuery.of(context).size.width / 2 - 16.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "BÁN",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "(-)",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
