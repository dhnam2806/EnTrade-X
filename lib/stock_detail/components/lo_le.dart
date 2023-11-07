import 'package:entradex/repo/datak.dart';
import 'package:entradex/stock_detail/bloc/intermediate_bloc/intermediate_bloc.dart';
import 'package:entradex/stock_detail/components/chart_table.dart';
import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoLe extends StatefulWidget {
  const LoLe({super.key});

  @override
  State<LoLe> createState() => _LoLeState();
}

class _LoLeState extends State<LoLe> {
  @override
  Widget build(BuildContext context) {
    final intermediateBloc = BlocProvider.of<IntermediateBloc>(context);
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChartTable(
                  percentages: percentages, percentages2: percentages2),
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
                            GestureDetector(
                              onTap: () => intermediateBloc.add(
                                  IntermediateSelectedPriceEvent(
                                      index: "86.10")),
                              child: Text(
                                "86.10",
                                style: AppTextStyle.bodyMedium_15.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            GestureDetector(
                              onTap: () => intermediateBloc.add(
                                  IntermediateSelectedPriceEvent(
                                      index: "92.34")),
                              child: Text(
                                "92.34",
                                style: AppTextStyle.bodyMedium_15.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.red,
                                ),
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
                            GestureDetector(
                              onTap: () => intermediateBloc.add(
                                  IntermediateSelectedPriceEvent(
                                      index: "92.50")),
                              child: Text(
                                "92.50",
                                style: AppTextStyle.bodyMedium_15.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.yellow,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            GestureDetector(
                              onTap: () => intermediateBloc.add(
                                  IntermediateSelectedPriceEvent(
                                      index: "91.31")),
                              child: Text(
                                "91.31",
                                style: AppTextStyle.bodyMedium_15.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.green,
                                ),
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
                            GestureDetector(
                              onTap: () => intermediateBloc.add(
                                  IntermediateSelectedPriceEvent(
                                      index: "98.90")),
                              child: Text(
                                "98.90",
                                style: AppTextStyle.bodyMedium_15.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.purple,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            GestureDetector(
                              onTap: () => intermediateBloc.add(
                                  IntermediateSelectedPriceEvent(
                                      index: "93.50")),
                              child: Text(
                                "93.50",
                                style: AppTextStyle.bodyMedium_15.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.green,
                                ),
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
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giá khớp lô lẻ:',
                        style: AppTextStyle.bodyMedium_15.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('92.50',
                              style: AppTextStyle.headlineSmall_20.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
                              )),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '(0.10 0.11%)',
                            style: AppTextStyle.bodyMedium_15.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'KL khớp: ',
                          style: AppTextStyle.bodyMedium_15.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          children: [
                            TextSpan(
                              text: '5',
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
                      RichText(
                        text: TextSpan(
                          text: 'Tổng KLGD: ',
                          style: AppTextStyle.bodyMedium_15.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          children: [
                            TextSpan(
                              text: '835',
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
