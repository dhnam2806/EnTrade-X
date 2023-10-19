import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:entradex/const/text.dart';
import 'package:entradex/stock_detail/components/event.dart';
import 'package:entradex/stock_detail/components/lo_le.dart';
import 'package:entradex/stock_detail/components/order_matching.dart';
import 'package:entradex/stock_detail/components/price_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPageView extends StatefulWidget {
  const ListPageView({super.key});

  @override
  State<ListPageView> createState() => _ListPageViewState();
}

class _ListPageViewState extends State<ListPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background.withOpacity(0.6),
      width: double.infinity,
      height: 260.h,
      child: ContainedTabBarView(
          tabs: [
            Text('Bước giá'),
            Text('Khớp lệnh'),
            Text('Lô lẻ'),
            Text('Sự kiện'),
          ],
          views: [
            PriceStep(),
            OrderMatching(),
            LoLe(),
            Event(),
          ],
          onChange: (index) => print(index),
          tabBarViewProperties: TabBarViewProperties(
            physics: BouncingScrollPhysics(),
          ),
          tabBarProperties: TabBarProperties(
            height: 28,
            labelStyle: TextStyle(
              fontSize: TextStyles.headerTextSize16,
              fontWeight: FontWeight.w500,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
          )),
    );
  }
}
