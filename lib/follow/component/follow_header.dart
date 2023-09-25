import 'package:entradex/follow/component/securities_list.dart';
import 'package:entradex/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Menu/screen/search_screen.dart';

class FollowHeader extends StatelessWidget {
  const FollowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;

    return Container(
      height: size.height * 0.22,
      padding: EdgeInsets.only(top: safePadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Colors.grey[900]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SearchScreen(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: SearchWidget()),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.lightbulb, color: Colors.yellow),
              )
            ],
          ),
          SecuritiesList(),
        ],
      ),
    );
  }
}
