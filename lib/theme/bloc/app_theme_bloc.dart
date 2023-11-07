import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeState(isDarkTheme: false)) {
    on<ThemeInitEvent>(themeInitEvent);
    on<ThemeChangeEvent>(themeChangeEvent);
  }


  FutureOr<void> themeChangeEvent(ThemeChangeEvent event, Emitter<AppThemeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', event.isDarkTheme);
    emit(AppThemeState(isDarkTheme: event.isDarkTheme));
  }

  FutureOr<void> themeInitEvent(ThemeInitEvent event, Emitter<AppThemeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    emit(AppThemeState(isDarkTheme: isDarkTheme));
  }
}
