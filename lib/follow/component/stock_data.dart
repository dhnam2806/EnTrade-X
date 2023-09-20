import 'package:flutter/material.dart';

class StockData extends StatefulWidget {
  const StockData({super.key});

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
  List data = [
    {
      "name": "VNM",
      "price": 22.45,
      "total": 1000,
      "changePercent": 10,
    },
    {
      "name": "VNM",
      "price": 60.00,
      "total": 1000,
      "changePercent": -0.5,
    },
    {
      "name": "VNM",
      "price": 10000,
      "total": 1000,
      "changePercent": -2,
    },
    {
      "name": "VNM",
      "price": 10000,
      "total": 1000,
      "changePercent": 10,
    },
    {
      "name": "HDB",
      "price": 17.20,
      "total": 3854,
      "changePercent": 0.00,
    },
    {
      "name": "VNM",
      "price": 10000,
      "total": 1000,
      "changePercent": 10,
    },
    {
      "name": "VNM",
      "price": 10000,
      "total": 1000,
      "changePercent": 10,
    },
    {
      "name": "POW",
      "price": 12.20,
      "total": 14070,
      "changePercent": 0.00,
    },
    {
      "name": "VNM",
      "price": 10000,
      "total": 1000,
      "changePercent": 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mã",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              Text("Khớp",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              Text("%",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              Text("Tổng KL",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  // margin: EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data[index]["name"],
                        style: TextStyle(
                            color: data[index]["changePercent"] == 0
                                ? Colors.yellow
                                : data[index]["changePercent"] > 0
                                    ? Colors.green
                                    : Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data[index]["price"].toString(),
                        style: TextStyle(
                            color: data[index]["changePercent"] == 0
                                ? Colors.yellow
                                : data[index]["changePercent"] > 0
                                    ? Colors.green
                                    : Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data[index]["changePercent"].toString(),
                        style: TextStyle(
                            color: data[index]["changePercent"] == 0
                                ? Colors.yellow
                                : data[index]["changePercent"] > 0
                                    ? Colors.green
                                    : Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data[index]["total"].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
