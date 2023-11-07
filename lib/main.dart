import 'package:device_preview/device_preview.dart';
import 'package:entradex/bot_navbar.dart';
import 'package:entradex/follow/bloc/follow_bloc.dart';
import 'package:entradex/stock_detail/bloc/detail_bloc/detail_bloc.dart';
import 'package:entradex/stock_detail/bloc/intermediate_bloc/intermediate_bloc.dart';
import 'package:entradex/theme/app_theme.dart';
import 'package:entradex/theme/bloc/app_theme_bloc.dart';
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
        BlocProvider(create: (context) => AppThemeBloc()..add(ThemeInitEvent())),
        BlocProvider(create: (context) => FollowBloc()),
        BlocProvider(create: (context) => DetailBloc()),
        BlocProvider(
            create: (context) => IntermediateBloc(
                  BlocProvider.of<DetailBloc>(context),
                )),
      ],
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
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
                themeMode:
                    state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
                darkTheme: darkThemeData,
                theme: lightThemeData,
                home: BotNavbar(),
              );
            },
          );
        },
      ),
    );
  }
}
