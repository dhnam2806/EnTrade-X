import 'package:entradex/stock_detail/components/event.dart';
import 'package:entradex/stock_detail/components/lo_le.dart';
import 'package:entradex/stock_detail/components/order_matching.dart';
import 'package:entradex/stock_detail/components/price_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  List<Widget> page = [
    PriceStep(),
    OrderMatching(),
    LoLe(),
    Event(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    _controller.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: Text(
                    "Bước giá",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: _selectedIndex == 0 ? Colors.red : Colors.white),
                  )),
              SizedBox(width: 16.w),
              GestureDetector(
                onTap: () {
                  _controller.animateToPage(1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Text(
                  "Khớp lệnh",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: _selectedIndex == 1 ? Colors.red : Colors.white),
                ),
              ),
              SizedBox(width: 16.w),
              GestureDetector(
                  onTap: () {
                    _controller.animateToPage(2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: Text(
                    "Lô lẻ",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: _selectedIndex == 2 ? Colors.red : Colors.white),
                  )),
              SizedBox(width: 16.w),
              GestureDetector(
                  onTap: () {
                    _controller.animateToPage(3,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: Text(
                    "Sự kiện",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: _selectedIndex == 3 ? Colors.red : Colors.white),
                  )),
            ],
          ),
        ),
        Container(
          height: 240.h,
          child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              itemCount: page.length,
              itemBuilder: (context, index) {
                return page[index];
              }),
        ),
      ],
    );
  }
}
