import 'package:entradex/follow/component/news_list.dart';
import 'package:entradex/stock_detail/components/detail_header.dart';
import 'package:entradex/stock_detail/components/list_page.dart';
import 'package:entradex/stock_detail/components/purchase_order.dart';
import 'package:entradex/stock_detail/components/related_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/search.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(children: [
              DetailHeader(),
              SizedBox(height: 8.h),
              ListPage(),
              SizedBox(height: 8.h),
              RelatedNews(),
              SizedBox(height: 200.h),
            ]),
          ),
          PurchaseOrder(),
        ],
      )),
    );
  }
}
