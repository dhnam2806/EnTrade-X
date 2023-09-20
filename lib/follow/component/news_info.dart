
import 'package:flutter/material.dart';

class NewsInfo extends StatelessWidget {
  String name;
  double changePercent;
  NewsInfo({
    required this.name,
    required this.changePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Text(name + " " + changePercent.toString() + "%",
            style: TextStyle(
                // fontSize: 15,
                color: changePercent == 0
                    ? Colors.yellow[200]
                    : (changePercent > 0 ? Colors.green[300] : Colors.red[200]),
                fontWeight: FontWeight.w500)),
        decoration: BoxDecoration(
          color: changePercent == 0
              ? Colors.yellow[800]
              : (changePercent > 0 ? Colors.green[800] : Colors.red[800]),
          borderRadius: BorderRadius.circular(50),
        ));
  }
}
