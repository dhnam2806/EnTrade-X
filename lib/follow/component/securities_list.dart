import 'package:entradex/follow/component/securities_item.dart';
import 'package:flutter/material.dart';

class SecuritiesList extends StatelessWidget {
  const SecuritiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: EdgeInsets.all(4),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        SecuritiesItem(
          name: 'VNI',
          price: 1234.5,
          change: 4.39,
          changePercent: -0.36,
        ),
        SecuritiesItem(
          name: 'VN30',
          price: 1234.5,
          change: 12.3,
          changePercent: 1.2,
        ),
        SecuritiesItem(
          name: 'VN30F2104',
          price: 1234.5,
          change: 12.3,
          changePercent: 1.2,
        ),
        SecuritiesItem(
          name: 'VN30F2104',
          price: 1234.5,
          change: 12.3,
          changePercent: 1.2,
        ),
        SecuritiesItem(
          name: 'HNX',
          price: 1234.5,
          change: 1.4,
          changePercent: -0.36,
        ),
        SecuritiesItem(
          name: 'Upcom',
          price: 1234.5,
          change: 12.3,
          changePercent: 1.2,
        ),
      ]),
    );
  }
}
