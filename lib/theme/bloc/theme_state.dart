part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  final bool isDarkTheme;
  ThemeInitial({this.isDarkTheme = false});
}
