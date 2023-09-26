import 'package:entradex/bottom_navbar/bot_navbar.dart';
import 'package:entradex/follow/screen/follow_screen.dart';
import 'package:entradex/theme/theme.dart';
import 'package:flutter/material.dart';
import './theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EnTrade X',
      theme: NAppTheme.lightTheme,
      darkTheme: NAppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: BotNavbar(),
      // home: FollowScreen(),
    );
  }
}
