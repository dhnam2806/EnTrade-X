import 'package:entradex/model/stock.dart';
import 'package:entradex/stock_detail/components/detail_header.dart';
import 'package:entradex/stock_detail/components/purchase_order.dart';
import 'package:entradex/stock_detail/components/related_news.dart';
import 'package:entradex/stock_detail/components/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/search.dart';
import '../bloc/detail_bloc.dart';
import '../components/order.dart';

class DetailScreen extends StatefulWidget {
  final Stock stock;
  const DetailScreen({super.key, required this.stock});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailBloc>(context)
        .add(DetailInitialEvent(stock: widget.stock));
  }

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
              ListPageView(),
              SizedBox(height: 8.h),
              RelatedNews(),
              SizedBox(height: 180.h),
            ]),
          ),
          PurchaseOrder(),
          // Order(),
        ],
      )),
    );
  }
}
