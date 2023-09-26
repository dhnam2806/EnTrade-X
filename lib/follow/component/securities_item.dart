import 'package:flutter/material.dart';

class SecuritiesItem extends StatelessWidget {
  String name;
  double price;
  double change;
  double changePercent;

  SecuritiesItem({
    required this.name,
    required this.price,
    required this.change,
    required this.changePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Text(
              name.toUpperCase(),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(width: 8),
            Text(
              price.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: changePercent > 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text((changePercent > 0 ? "+" : "-") + "$change  ($changePercent%)",
            style: TextStyle(
              color: changePercent > 0 ? Colors.green : Colors.red,
            )),
      ]),
    );
  }
}
