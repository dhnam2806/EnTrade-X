part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeSwitchOnEvent extends ThemeEvent {
  bool isDarkTheme;
  ThemeSwitchOnEvent({required this.isDarkTheme});
}

class ThemeSwitchOffEvent extends ThemeEvent {
  bool isDarkTheme;
  ThemeSwitchOffEvent({required this.isDarkTheme});
}
