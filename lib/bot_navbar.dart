import 'package:entradex/Menu/screen/menu_screen.dart';
import 'package:entradex/follow/screen/follow_screen.dart';
import 'package:entradex/screens/home_screen.dart';
import 'package:entradex/screens/library_screen.dart';
import 'package:entradex/screens/message_screen.dart';
import 'package:entradex/screens/own_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BotNavbar extends StatefulWidget {
  const BotNavbar({super.key});

  @override
  State<BotNavbar> createState() => _BotNavbarState();
}

class _BotNavbarState extends State<BotNavbar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      FollowScreen(),
      LibraryScreen(),
      OwnScreen(),
      MessageScreen(),
      MenuScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: Theme.of(context).colorScheme.surface,
      ),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.chart_bar_alt_fill),
          title: ("Theo dõi"),
          activeColorPrimary: CupertinoColors.systemRed,
          inactiveColorPrimary: Theme.of(context).colorScheme.surface),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.news),
        title: ("Sổ lệnh"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: Theme.of(context).colorScheme.surface,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.folder_badge_person_crop),
        title: ("Sở hữu"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: Theme.of(context).colorScheme.surface,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.chat_bubble),
        title: ("Tin nhắn"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: Theme.of(context).colorScheme.surface,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_solid),
        title: ("Menu"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: Theme.of(context).colorScheme.surface,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Theme.of(context).colorScheme.background, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
