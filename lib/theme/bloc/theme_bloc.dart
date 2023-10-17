import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(isDarkTheme: false)) {
    on<ThemeSwitchOnEvent>(themeSwitchOnEvent);
    on<ThemeSwitchOffEvent>(themeSwitchOffEvent);
  }

  FutureOr<void> themeSwitchOnEvent(
      ThemeSwitchOnEvent event, Emitter<ThemeState> emit) async {
    final SharedPreferences _themePreferences =
        await SharedPreferences.getInstance();
    // Set the value to the shared preferences.
    await _themePreferences.setBool('isDarkTheme', true);
    emit(ThemeInitial(isDarkTheme: event.isDarkTheme ));
  }

  FutureOr<void> themeSwitchOffEvent(
      ThemeSwitchOffEvent event, Emitter<ThemeState> emit) async {
    // Obtain shared preferences.
    final SharedPreferences _themePreferences =
        await SharedPreferences.getInstance();
    // Set the value to the shared preferences.
    await _themePreferences.setBool('isDarkTheme', false);
    emit(ThemeInitial(isDarkTheme: event.isDarkTheme));
  }
}
