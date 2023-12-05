import 'package:entradex/follow/component/securities_list.dart';
import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../menu/screen/search_screen.dart';
import '../bloc/follow_bloc.dart';

class FollowHeader extends StatelessWidget {
  const FollowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return BlocListener<FollowBloc, FollowState>(
      bloc: BlocProvider.of<FollowBloc>(context),
      listener: (context, state) {
        if (state is SearchStockNavigateState) {
          pushNewScreen(
            context,
            screen: SearchScreen(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: safePadding + 2.h, bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          color: Theme.of(context).colorScheme.background.withOpacity(0.9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      BlocProvider.of<FollowBloc>(context)
                          .add(SearchStockNavigateEvent());
                    },
                    child: SearchWidget()),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 45, 44, 44).withOpacity(0.1),
                        spreadRadius: 0.4,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(Icons.lightbulb, color: AppColors.yellow),
                )
              ],
            ),
            SizedBox(height: 4.h),
            SecuritiesList(),
          ],
        ),
      ),
    );
  }
}
