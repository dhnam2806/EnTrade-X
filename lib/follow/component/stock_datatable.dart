import 'package:entradex/follow/component/bottom_add.dart';
import 'package:entradex/model/stock.dart';
import 'package:flutter/material.dart';
import '../bloc/follow_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockData extends StatefulWidget {
  const StockData({super.key});

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
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
    final popup = ["VN30", "Phá sinh", "HOSE"];
    bool isSelect = true;
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return BlocConsumer<FollowBloc, FollowState>(
      bloc: followBloc,
      listener: (context, state) {
        if (state is AddMoreState) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                  child: Container(
                      padding:
                          EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
                      child: BottomAdd()));
            },
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
                label: Expanded(
                  child: Text(
                    column,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              );
            }).toList();
          }

          List<DataCell> getCells(List<dynamic> cells, double changePercent) {
            return cells.map((data) {
              return DataCell(Text(
                data.toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: changePercent == 0
                        ? Colors.yellow
                        : (changePercent < 0 ? Colors.red : Colors.green)),
              ));
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
              return DataRow(cells: getCells(cells, stock.changePercent));
            }).toList();
          }

          return Container(
            color: Theme.of(context).colorScheme.background.withOpacity(0.8),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0.4,
                                blurRadius: 1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(child: Text("D1")),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            followBloc.add(AddMoreEvent());
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0.4,
                                  blurRadius: 1,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(child: Text("+")),
                          ),
                        ),
                      ],
                    ),
                    PopupMenuButton(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              value: "VN30",
                              child: RadioListTile(
                                activeColor: Colors.red,
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
                                title: Text(popup[0]),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              value: "Phái sinh",
                              child: RadioListTile(
                                activeColor: Colors.red,
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
                                title: Text(popup[1]),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              value: "HOSE",
                              child: RadioListTile(
                                activeColor: Colors.red,
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
                                title: Text(popup[2]),
                              ),
                            ),
                          ];
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text(
                                select,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.white),
                            ],
                          ),
                        )),
                  ],
                ),
                DataTable(
                  horizontalMargin: 0,
                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  columns: getColumn(column),
                  rows: getRow(data),
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
