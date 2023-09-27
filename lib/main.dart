import 'package:entradex/bottom_navbar/bot_navbar.dart';
import 'package:entradex/follow/bloc/follow_bloc.dart';
import 'package:entradex/theme/bloc/theme_bloc.dart';
import 'package:entradex/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final success = state as ThemeInitial;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EnTrade X',
            theme: success.isDarkTheme
                ? NAppTheme.darkTheme
                : NAppTheme.lightTheme,
            // darkTheme: NAppTheme.darkTheme,
            // themeMode: ThemeMode.dark,
            home: BotNavbar(),
            // home: FollowScreen(),
          );
        },
      ),
    );
  }
}
