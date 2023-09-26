import 'package:entradex/follow/component/securities_list.dart';
import 'package:entradex/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Menu/screen/search_screen.dart';
import '../bloc/follow_bloc.dart';

class FollowHeader extends StatelessWidget {
  const FollowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;

    return BlocListener<FollowBloc, FollowState>(
      bloc: BlocProvider.of<FollowBloc>(context),
      listener: (context, state) {
        // TODO: implement listener
        if (state is SearchStockNavigateState) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SearchScreen(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
      child: Container(
        height: size.height * 0.22,
        padding: EdgeInsets.only(top: safePadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            color: Theme.of(context).colorScheme.background.withOpacity(0.6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.4,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(Icons.lightbulb, color: Colors.yellow),
                )
              ],
            ),
            SecuritiesList(),
          ],
        ),
      ),
    );
  }
}
