import 'package:entradex/theme/app_textstyle.dart';
import 'package:entradex/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/detail_bloc.dart';
import 'package:intl/intl.dart';
import 'package:entradex/theme/app_colors.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({super.key});

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final numberFormat = new NumberFormat("##,##0", "en_US");
  final double money = 1200000000;
  String selectedButton = "LO";
  bool enableText = true;
  String textToDisplay = '';

  void calculateAndSetText() {
    double price = priceController.text == ''
        ? 92200
        : double.parse(priceController.text) * 1000;
    String priceText = (money / price).toStringAsFixed(0);
    setState(() {
      textToDisplay = priceText;
    });
  }

  @override
  void initState() {
    super.initState();
    calculateAndSetText();
    priceController.addListener(calculateAndSetText);
  }

  @override
  void dispose() {
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailBloc = BlocProvider.of<DetailBloc>(context);
    String formattedPrice = numberFormat.format(money);

    return BlocConsumer<DetailBloc, DetailState>(
      bloc: detailBloc,
      listener: (context, state) {},
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
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray.withOpacity(0.6),
                  spreadRadius: 0.4,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        children: [
                          Text("Sức mua: ",
                              style: AppTextStyle.bodySmall_14.copyWith(
                                color: AppColors.secondary,
                              )),
                          Text(
                            formattedPrice,
                            style: AppTextStyle.bodySmall_14.copyWith(
                              fontWeight: FontWeight.w400,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 45, 44, 44)
                                    .withOpacity(0.2),
                                spreadRadius: 0.4,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text("Lệnh điều kiện",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.settings,
                          size: 24.sp,
                          color: Theme.of(context).colorScheme.primary,
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
                          enableText = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: selectedButton == "LO"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 49, 49, 49)
                                  .withOpacity(0.2),
                              spreadRadius: 0.4,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          "LO",
                          style: AppTextStyle.labelMedium_16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: selectedButton == "LO"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .color,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = "MP";
                          priceController.text = "";
                          enableText = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: selectedButton == "MP"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 49, 49, 49)
                                  .withOpacity(0.2),
                              spreadRadius: 0.4,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          "MP",
                          style: AppTextStyle.labelMedium_16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: selectedButton == "MP"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .color,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = "ATC";
                          priceController.text = "";
                          enableText = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: selectedButton == "ATC"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 49, 49, 49)
                                  .withOpacity(0.2),
                              spreadRadius: 0.4,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          "ATC",
                          style: AppTextStyle.labelMedium_16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: selectedButton == "ATC"
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .color,
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
                      child: TextFieldCustom(
                        controller: priceController,
                        enabled: enableText,
                        title: "Giá đặt",
                        onTapRemove: () {
                          if (selectedButton == "LO") {
                            if (priceController.text == "") {
                              priceController.text =
                                  success.stock.price.toString();
                            } else {
                              priceController.text =
                                  (double.parse(priceController.text) - 0.5)
                                      .toString();
                            }
                          }
                        },
                        onTapAdd: () {
                          if (selectedButton == "LO") {
                            if (priceController.text == "") {
                              priceController.text =
                                  success.stock.price.toString();
                            } else {
                              priceController.text =
                                  (double.parse(priceController.text) + 0.5)
                                      .toString();
                            }
                          }
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectedButton == "LO") {
                          priceController.text = success.stock.price.toString();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedButton == "LO"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text("Giá khớp",
                            style: AppTextStyle.labelSmall_14.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            )),
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
                      child: TextFieldCustom(
                        controller: quantityController,
                        title: "Khối lượng",
                        onTapRemove: () {
                          if (selectedButton == "LO") {
                            if (quantityController.text == "") {
                              quantityController.text = "0";
                            } else if (int.parse(quantityController.text) >
                                100) {
                              quantityController.text =
                                  (int.parse(quantityController.text) - 100)
                                      .toString();
                            } else {
                              quantityController.text =
                                  (int.parse(quantityController.text) - 1)
                                      .toString();
                            }
                          }
                        },
                        onTapAdd: () {
                          if (selectedButton == "LO") {
                            if (quantityController.text == "") {
                              quantityController.text = "100";
                            } else {
                              quantityController.text =
                                  (int.parse(quantityController.text) + 100)
                                      .toString();
                            }
                          }
                        },
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
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            "MUA",
                            style: AppTextStyle.labelLarge_18.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            textToDisplay,
                            style: AppTextStyle.labelLarge_18.copyWith(
                              fontWeight: FontWeight.w400,
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
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            "BÁN",
                            style: AppTextStyle.labelLarge_18.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "(0)",
                            style: AppTextStyle.labelLarge_18.copyWith(
                              fontWeight: FontWeight.w400,
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
