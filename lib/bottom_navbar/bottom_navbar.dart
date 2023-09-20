import 'package:entradex/bottom_navbar/bloc/navbar_bloc.dart';
import 'package:entradex/follow/screen/follow_screen.dart';
import 'package:entradex/screens/home_screen.dart';
import 'package:entradex/screens/library_screen.dart';
import 'package:entradex/screens/message_screen.dart';
import 'package:entradex/screens/own_screen.dart';
import 'package:entradex/Menu/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    FollowScreen(),
    LibraryScreen(),
    OwnScreen(),
    MessageScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navbarBloc = NavbarBloc();
    return BlocConsumer<NavbarBloc, NavbarState>(
      bloc: navbarBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Theme.of(context).colorScheme.background,
          body: screens[navbarBloc.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            onTap: (index) => {
              navbarBloc.add(NavbarChangeIndexEvent(index: index)),
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red,
            currentIndex: navbarBloc.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chart_bar_square),
                label: 'Theo dõi',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_list),
                label: 'Sổ lệnh',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet),
                label: 'Sở hữu',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_text),
                label: 'Tin nhắn',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Menu',
              ),
            ],
          ),
        );
      },
    );
  }
}
