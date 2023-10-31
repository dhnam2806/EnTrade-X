import 'package:entradex/menu/screen/search_screen.dart';
import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:entradex/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final safePadding = MediaQuery.of(context).padding.top;

    return Container(
      height: size.height * 0.24,
      // padding: EdgeInsets.only(top: safePadding),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withOpacity(0.2),
              spreadRadius: 0.4,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          color: Theme.of(context).colorScheme.background),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: SearchScreen(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: SearchWidget()),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      spreadRadius: 0.4,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.lightbulb,
                  color: AppColors.yellow,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/john-wick.jpg'),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Dương Nam',
                  style: AppTextStyle.labelLarge_18.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.labelMedium!.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
