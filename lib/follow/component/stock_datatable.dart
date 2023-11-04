import 'package:entradex/follow/component/collection.dart';
import 'package:entradex/model/stock.dart';
import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../bloc/follow_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../stock_detail/screen/detail_screen.dart';

class StockData extends StatefulWidget {
  const StockData({super.key});

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
  final numberFormat = new NumberFormat("##,##0", "en_US");
  bool isAscending = false;
  int? sortColumnIndex;
  int sortCount = 0;
  String select = "VN30";
  final FollowBloc followBloc = FollowBloc();

  @override
  void initState() {
    super.initState();
    followBloc.add(StockInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    final column = ["Mã", "Khớp", "%", "Tổng KL"];
    final popup = ["VN30", "Phái sinh", "HOSE"];

    return BlocConsumer<FollowBloc, FollowState>(
      bloc: followBloc,
      listener: (context, state) {
        if (state is SelectStockNavigateState) {
          pushNewScreen(
            context,
            screen: DetailScreen(
              stock: state.stock,
            ),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
      listenWhen: (previous, current) => current is FollowActionState,
      buildWhen: (previous, current) => current is! FollowActionState,
      builder: (context, state) {
        if (state is FollowLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is StockLoadedState) {
          final success = state as StockLoadedState;
          final data = success.stocks;

          void resetDataTable() {
            data.sort((a, b) => a.name.compareTo(b.name));
            setState(() {
              this.sortColumnIndex = null;
              this.isAscending = true;
              sortCount = 0;
            });
          }

          List<DataColumn> getColumn(List<String> column) {
            return column.map((String column) {
              return DataColumn(
                numeric: column == "Tổng KL" ? true : false,
                onSort: (columnIndex, ascending) {
                  if (sortCount == 2) {
                    resetDataTable();
                    return;
                  }
                  if (columnIndex == 0) {
                    resetDataTable();
                  }
                  if (columnIndex == 1) {
                    data.sort((a, b) => ascending
                        ? a.price.compareTo(b.price)
                        : b.price.compareTo(a.price));
                  }
                  if (columnIndex == 2) {
                    data.sort((a, b) => ascending
                        ? a.changePercent.compareTo(b.changePercent)
                        : b.changePercent.compareTo(a.changePercent));
                  }
                  if (columnIndex == 3) {
                    data.sort((a, b) => ascending
                        ? a.total.compareTo(b.total)
                        : b.total.compareTo(a.total));
                  }
                  setState(() {
                    sortColumnIndex = columnIndex;
                    isAscending = ascending;
                    sortCount++;
                  });
                },
                label: Text(
                  column,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              );
            }).toList();
          }

          List<DataCell> getCells(List<dynamic> cells, double changePercent) {
            return cells.map((idx) {
              Color textColor = Theme.of(context).textTheme.bodyMedium!.color!;
              if (idx is double || idx == cells[0]) {
                textColor = changePercent == 0
                    ? AppColors.yellow
                    : (changePercent < 0 ? AppColors.red : AppColors.green);
              }
              if (idx is double) {
                idx = idx.toStringAsFixed(2);
              }
              if (idx is int) {
                idx =  numberFormat.format(idx);
              }
              return DataCell(
                Text(idx,
                    style: AppTextStyle.bodyMedium_15.copyWith(
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    )),
              );
            }).toList();
          }

          List<DataRow> getRow(List<Stock> data) {
            return data.map((Stock stock) {
              final cells = [
                stock.name,
                stock.price,
                stock.changePercent,
                stock.total
              ];
              return DataRow(
                cells: getCells(cells, stock.changePercent),
                onSelectChanged: (isSelected) {
                  followBloc.add(SelectStockNavigateEvent(stock: stock));
                },
              );
            }).toList();
          }

          return Container(
            color: Theme.of(context).colorScheme.background.withOpacity(0.9),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 32.h,
                            child: Collection()),
                      ],
                    ),
                    PopupMenuButton(
                        color: Theme.of(context).colorScheme.onBackground,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              value: "VN30",
                              child: RadioListTile(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: "VN30",
                                groupValue: select,
                                onChanged: (value) {
                                  followBloc
                                      .add(StockSelectedEvent(value: value!));
                                  setState(() {
                                    select = value.toString();
                                    Navigator.pop(context);
                                  });
                                },
                                title: Text(
                                  popup[0],
                                  style: AppTextStyle.labelMedium_16.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .color,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              value: "Phái sinh",
                              child: RadioListTile(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: "Phái sinh",
                                groupValue: select,
                                onChanged: (value) {
                                  followBloc
                                      .add(StockSelectedEvent(value: value!));

                                  setState(() {
                                    select = value.toString();
                                    Navigator.pop(context);
                                  });
                                },
                                title: Text(
                                  popup[1],
                                  style: AppTextStyle.labelMedium_16.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .color,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              value: "HOSE",
                              child: RadioListTile(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: "HOSE",
                                groupValue: select,
                                onChanged: (value) {
                                  followBloc
                                      .add(StockSelectedEvent(value: value!));
                                  setState(() {
                                    select = value.toString();
                                    Navigator.pop(context);
                                  });
                                },
                                title: Text(
                                  popup[2],
                                  style: AppTextStyle.labelMedium_16.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .color,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ];
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text(
                                select,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.white),
                            ],
                          ),
                        )),
                  ],
                ),
                DataTable(
                  showCheckboxColumn: false,
                  horizontalMargin: 0,
                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  columns: getColumn(column),
                  rows: getRow(data),
                  columnSpacing: 52.w,
                  dataRowHeight: 44.h,
                ),
              ],
            ),
          );
        }
        return Center(
          child: Text("Error"),
        );
      },
    );
  }
}
