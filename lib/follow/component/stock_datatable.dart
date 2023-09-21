import 'package:entradex/model/stock.dart';
import 'package:flutter/material.dart';

class StockData extends StatefulWidget {
  const StockData({super.key});

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
  bool isAscending = false;
  int? sortColumnIndex;
  int sortCount = 0;
  List<Stock> data = [];
  String select = "VN30";

  @override
  void initState() {
    super.initState();
    data = data0;
  }

  List<Stock> data0 = [
    Stock(name: "ACB", price: 22.45, changePercent: 0.15, total: 529470),
    Stock(name: "BID", price: 60.00, changePercent: -0.5, total: 26100),
    Stock(name: "CTG", price: 10000, changePercent: -2, total: 6730),
    Stock(name: "FPT", price: 98.50, changePercent: 10, total: 1000),
    Stock(name: "HDB", price: 17.20, changePercent: 0.00, total: 3854),
    Stock(name: "HPG", price: 10000, changePercent: 10, total: 1000),
    Stock(name: "MBB", price: 10000, changePercent: 10, total: 1000),
    Stock(name: "POW", price: 12.20, changePercent: 0.00, total: 14070),
    Stock(name: "SSI", price: 10000, changePercent: 10, total: 1000),
  ];

  List<Stock> data1 = [
    Stock(name: "VN30F23", price: 1231, changePercent: 0.15, total: 529470),
    Stock(name: "VN30F10", price: 1232, changePercent: -0.5, total: 26100),
    Stock(name: "VN30F12", price: 1228, changePercent: -2, total: 6730),
    Stock(name: "VN30F03", price: 1225, changePercent: 10, total: 1000),
  ];

  List<Stock> data2 = [
    Stock(name: "AAA", price: 22.45, changePercent: 0.15, total: 529470),
    Stock(name: "AAM", price: 60.00, changePercent: -0.5, total: 26100),
    Stock(name: "AAT", price: 10000, changePercent: -2, total: 6730),
    Stock(name: "ABR", price: 98.50, changePercent: 10, total: 1000),
    Stock(name: "ABS", price: 17.20, changePercent: 0.00, total: 3854),
    Stock(name: "ABT", price: 10000, changePercent: 10, total: 1000),
    Stock(name: "ACB", price: 10000, changePercent: 10, total: 1000),
    Stock(name: "POW", price: 12.20, changePercent: 0.00, total: 14070),
    Stock(name: "SSI", price: 10000, changePercent: 10, total: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    final column = ["Mã", "Khớp", "%", "Tổng KL"];
    final popup = ["VN30", "Phá sinh", "HOSE"];
    String selectItem = "VN30";
    bool isSelect = true;

    return SingleChildScrollView(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Danh mục",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                          setState(() {
                            select = value.toString();
                            data = data0;
                            Navigator.pop(context);
                          });
                        },
                        title: Text(popup[0]),
                      ),
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      value: "Phá sinh",
                      child: RadioListTile(
                        activeColor: Colors.red,
                        value: "Phái sinh",
                        groupValue: select,
                        onChanged: (value) {
                          setState(() {
                            select = value.toString();
                            data = data1;
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
                          setState(() {
                            select = value.toString();
                            data = data2;
                            Navigator.pop(context);
                          });
                        },
                        title: Text(popup[2]),
                      ),
                    ),
                  ];
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          // columnSpacing: size.width * 0.12,
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columns: getColumn(column),
          rows: getRow(data),
        ),
      ],
    ));
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
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ),
      );
    }).toList();
  }

  List<DataRow> getRow(List<Stock> data) {
    return data.map((Stock stock) {
      final cells = [stock.name, stock.price, stock.changePercent, stock.total];
      return DataRow(cells: getCells(cells, stock.changePercent));
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

  void resetDataTable() {
    data.sort((a, b) => a.name.compareTo(b.name));
    setState(() {
      this.sortColumnIndex = null;
      this.isAscending = true;
      sortCount = 0;
    });
  }
}
