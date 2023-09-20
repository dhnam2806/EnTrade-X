import 'package:entradex/follow/component/follow_header.dart';
import 'package:entradex/follow/component/news_list.dart';
import 'package:entradex/follow/component/news_select.dart';
import 'package:entradex/follow/component/stock_data.dart';
import 'package:flutter/material.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({super.key});

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          FollowHeader(),
          SizedBox(height: 12),
          StockData(),
          SizedBox(height: 12),
          Text(
            "Tin danh mục",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              NewsSelect(
                title: "Theo mã",
                isSelected: true,
              ),
              NewsSelect(title: "Vĩ mô"),
            ],
          ),
          NewsList(),
        ]),
      ),
    );
  }
}
