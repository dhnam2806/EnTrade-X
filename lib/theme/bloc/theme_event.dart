part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeSwitchOnEvent extends ThemeEvent {}

class ThemeSwitchOffEvent extends ThemeEvent {}
