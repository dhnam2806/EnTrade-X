import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(isDarkTheme: false)) {
    on<ThemeSwitchOnEvent>(themeSwitchOnEvent);
    on<ThemeSwitchOffEvent>(themeSwitchOffEvent);
  }

  FutureOr<void> themeSwitchOnEvent(
      ThemeSwitchOnEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeInitial(isDarkTheme: event.isDarkTheme ));
  }

  FutureOr<void> themeSwitchOffEvent(
      ThemeSwitchOffEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeInitial(isDarkTheme: event.isDarkTheme));
  }
}
