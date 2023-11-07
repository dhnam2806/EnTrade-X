import 'package:entradex/model/order_time.dart';
import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderMatching extends StatefulWidget {
  const OrderMatching({super.key});

  @override
  State<OrderMatching> createState() => _OrderMatchingState();
}

class _OrderMatchingState extends State<OrderMatching> {
  List<String> column = ['Thời gian', 'Khối lượng', 'Giá khớp', '+/-'];

  List<OrderTime> data = [
    OrderTime(time: '09:00:00', number: "50", price: 92.20, percent: -0.50),
    OrderTime(time: '09:20:00', number: "1,00", price: 92.40, percent: 0.30),
    OrderTime(time: '09:40:00', number: "20", price: 92.00, percent: -0.10),
    OrderTime(time: '09:00:00', number: "10", price: 92.60, percent: 0.30),
    OrderTime(time: '09:00:00', number: "30", price: 92.80, percent: 0.20),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                'Khớp lệnh theo thời gian',
                style: AppTextStyle.labelLarge_18.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.labelLarge!.color,
                ),
              ),
            ),
            Center(
              child: DataTable(
                horizontalMargin: 0,
                columns: getColumn(column),
                rows: getRow(data),
                columnSpacing: 44.w,
                dataRowHeight: 30.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> getColumn(List<String> column) {
    return column.map((String column) {
      return DataColumn(
        label: Text(
          column,
          style: AppTextStyle.bodySmall_14.copyWith(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      );
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells, double changePercent) {
    return cells.map((data) {
      Color textColor = Theme.of(context).textTheme.bodyMedium!.color!;
      if (data is double) {
        textColor = changePercent == 0
            ? AppColors.yellow
            : (changePercent < 0 ? AppColors.red : AppColors.green);
      }

      return DataCell(
        Center(
          child: Text(
            data.toString(),
            style: AppTextStyle.bodySmall_14.copyWith(
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      );
    }).toList();
  }

  List<DataRow> getRow(List<OrderTime> data) {
    return data.map((OrderTime data) {
      final cells = [data.time, data.number, data.price, data.percent];
      return DataRow(cells: getCells(cells, data.percent));
    }).toList();
  }
}
