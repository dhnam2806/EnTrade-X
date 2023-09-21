import 'package:entradex/follow/component/follow_header.dart';
import 'package:entradex/follow/component/news_list.dart';
import 'package:entradex/follow/component/news_select.dart';
import 'package:entradex/follow/component/stock_datatable.dart';
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
          
          NewsList(),
        ]),
      ),
    );
  }
}
