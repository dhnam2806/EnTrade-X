import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/detail_bloc.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({super.key});

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String selectedButton = "LO";
  int money = 12000000;
  // final mon = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    final detailBloc = BlocProvider.of<DetailBloc>(context);

    return BlocConsumer<DetailBloc, DetailState>(
      bloc: detailBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      listenWhen: (previous, current) => current is DetailActionState,
      buildWhen: (previous, current) => current is! DetailActionState,
      builder: (context, state) {
        if (state is DetailLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DetailLoadedState) {
          final success = state as DetailLoadedState;
          return Container(
            padding:
                EdgeInsets.only(top: 12.h, left: 8.w, right: 8.w, bottom: 2.h),
            height: 180.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: "Sức mua: ",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: money.toString() + " VND",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Lệnh điều kiện",
                            style: TextStyle(
                              fontSize: 15.sp,
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
                SizedBox(height: 8.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = "LO";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: selectedButton == "LO"
                              ? Colors.red
                              : Colors.black54,
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
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = "MP";
                          _priceController.text = "";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: selectedButton == "MP"
                              ? Colors.red
                              : Colors.black54,
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
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = "ATC";
                          _priceController.text = "";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: selectedButton == "ATC"
                              ? Colors.red
                              : Colors.black54,
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
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
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
                          GestureDetector(
                              onTap: () {
                                if (selectedButton == "LO") {
                                  if (_priceController.text == "") {
                                    _priceController.text =
                                        success.stock.price.toString();
                                  } else {
                                    _priceController.text =
                                        (double.parse(_priceController.text) -
                                                0.5)
                                            .toString();
                                  }
                                }
                              },
                              child: Icon(Icons.remove)),
                          Container(
                            width: 80.w,
                            child: TextField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Giá đặt",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14.sp,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                if (selectedButton == "LO") {
                                  if (_priceController.text == "") {
                                    _priceController.text =
                                        success.stock.price.toString();
                                  } else {
                                    _priceController.text =
                                        (double.parse(_priceController.text) +
                                                0.5)
                                            .toString();
                                  }
                                }
                              },
                              child: Icon(Icons.add)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectedButton == "LO") {
                          _priceController.text =
                              success.stock.price.toString();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedButton == "LO"
                              ? Colors.red
                              : Color.fromARGB(255, 157, 41, 33),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Giá khớp",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: selectedButton == "LO"
                                  ? Colors.white
                                  : Colors.grey[400]),
                        ),
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
                          GestureDetector(
                              onTap: () {
                                if (selectedButton == "LO") {
                                  if (_quantityController.text == "") {
                                    _quantityController.text = "100";
                                  } else {
                                    _quantityController.text =
                                        (int.parse(_quantityController.text) -
                                                1)
                                            .toString();
                                  }
                                }
                              },
                              child: Icon(Icons.remove)),
                          Container(
                            width: 80.w,
                            child: TextField(
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Khối lượng",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14.sp,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                if (selectedButton == "LO") {
                                  if (_quantityController.text == "") {
                                    _quantityController.text = "100";
                                  } else {
                                    _quantityController.text =
                                        (int.parse(_quantityController.text) +
                                                1)
                                            .toString();
                                  }
                                }
                              },
                              child: Icon(Icons.add)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.w),
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
                            (money / (92.20 * 1000)).toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.w),
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
        return Container(
            child: Center(
          child: Text("Error"),
        ));
      },
    );
  }
}
