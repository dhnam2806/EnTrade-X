import 'package:entradex/stock_detail/bloc/intermediate_bloc/intermediate_bloc.dart';
import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../repo/datak.dart';

class ChartTable extends StatelessWidget {
  const ChartTable({
    super.key,
    required this.percentages,
    required this.percentages2,
  });

  final List<double> percentages;
  final List<double> percentages2;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final intermediateBloc = BlocProvider.of<IntermediateBloc>(context);
    return Column(
      children: [
        Container(
          child: DataTable(
            headingRowHeight: 0,
            dataRowHeight: 30,
            columnSpacing: 0.0,
            horizontalMargin: 0,
            columns: [
              DataColumn(label: Container()),
              DataColumn(label: Container()),
            ],
            rows: List.generate(
              3, // Use the length of dataList
              (index) => DataRow(
                cells: [
                  DataCell(
                    Container(
                      padding: EdgeInsets.zero,
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      height: 26.h,
                      width: MediaQuery.of(context).size.width * 0.47,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            // Màu bên trái
                            AppColors.green.withOpacity(0.2),
                            // Màu bên phải
                          ],
                          stops: [
                            1.0 - percentages[index],
                            // Điểm dừng bên trái
                            1.0 - percentages[index],
                            // Điểm dừng bên phải
                          ],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dataList1[index].price.toString(),
                            style: AppTextStyle.bodyMedium_15.copyWith(
                              fontWeight: FontWeight.w600,
                              color: textTheme.bodyLarge!.color,
                            ),
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: GestureDetector(
                                onTap: () => intermediateBloc.add(
                                    IntermediateSelectedPriceEvent(
                                        index: dataList1[index]
                                            .number
                                            .toString())),
                                child: Text(
                                  dataList1[index].number.toString(),
                                  style: AppTextStyle.bodyMedium_15.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      height: 26.h,
                      width: MediaQuery.of(context).size.width * 0.47,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            // Màu bên trái
                            AppColors.red.withOpacity(0.2),
                            // Màu bên phải
                          ],
                          stops: [
                            1.0 - percentages2[index],
                            // Điểm dừng bên trái
                            1.0 - percentages2[index],
                            // Điểm dừng bên phải
                          ],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: GestureDetector(
                                onTap: () => intermediateBloc.add(
                                    IntermediateSelectedPriceEvent(
                                        index: dataList2[index]
                                            .number
                                            .toString())),
                                child: Text(
                                  dataList2[index].number.toString(),
                                  style: AppTextStyle.bodyMedium_15.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              dataList2[index].price.toString(),
                              style: AppTextStyle.bodyMedium_15.copyWith(
                                fontWeight: FontWeight.w600,
                                color: textTheme.bodyLarge!.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.94,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: AppColors.green.withOpacity(0.6),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: AppColors.red.withOpacity(0.6),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
