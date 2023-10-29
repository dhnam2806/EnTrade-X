import 'package:entradex/stock_detail/bloc/prices_bloc.dart';
import 'package:entradex/stock_detail/components/chart_table.dart';
import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/datak.dart';
import '../bloc/detail_bloc.dart';

class PriceStep extends StatefulWidget {
  const PriceStep({super.key});

  @override
  State<PriceStep> createState() => _PriceStepState();
}

class _PriceStepState extends State<PriceStep> {
  @override
  Widget build(BuildContext context) {
    final priceBloc = BlocProvider.of<PricesBloc>(context);

    return SizedBox(
      height: 240.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChartTable(
                  percentages: percentages, percentages2: percentages2),
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Dư mua ',
                      style: AppTextStyle.bodyMedium_15.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      children: [
                        TextSpan(
                          text: '530',
                          style: AppTextStyle.bodyMedium_15.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Dư bán ',
                      style: AppTextStyle.bodyMedium_15.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      children: [
                        TextSpan(
                          text: '860',
                          style: AppTextStyle.bodyMedium_15.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
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
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Thấp",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.surface,
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
                              "86.10",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "92.34",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
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
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "TB",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.surface,
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
                              "92.50",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.yellow,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "91.31",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
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
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Cao",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.surface,
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
                              "98.90",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.purple,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "93.50",
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
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
                          style: AppTextStyle.bodyMedium_15.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          children: [
                            TextSpan(
                              text: '118K',
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(" | ",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 16.sp)),
                      RichText(
                        text: TextSpan(
                          text: 'NN bán ',
                          style: AppTextStyle.bodyMedium_15.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          children: [
                            TextSpan(
                              text: '0',
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
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
                    style: AppTextStyle.bodyMedium_15.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    children: [
                      TextSpan(
                        text: '0',
                        style: AppTextStyle.bodyMedium_15.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
