import 'package:entradex/bot_navbar.dart';
import 'package:entradex/follow/bloc/follow_bloc.dart';
import 'package:entradex/stock_detail/bloc/detail_bloc.dart';
import 'package:entradex/stock_detail/screen/detail_screen.dart';
import 'package:entradex/theme/bloc/theme_bloc.dart';
import 'package:entradex/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => FollowBloc()),
        BlocProvider(create: (context) => DetailBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final success = state as ThemeInitial;
          return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ),
                  child: child!,
                ),
                debugShowCheckedModeBanner: false,
                title: 'EnTrade X',
                theme: !success.isDarkTheme
                    ? NAppTheme.darkTheme
                    : NAppTheme.lightTheme,
                home: BotNavbar(),
                // home: DetailScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
