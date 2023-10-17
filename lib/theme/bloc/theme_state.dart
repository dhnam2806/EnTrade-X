part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  bool isDarkTheme;
  ThemeInitial({required this.isDarkTheme});
}

