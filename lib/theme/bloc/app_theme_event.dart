part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeEvent {}

class ThemeInitEvent extends AppThemeEvent {}

class ThemeChangeEvent extends AppThemeEvent {
  bool isDarkTheme;
  ThemeChangeEvent({required this.isDarkTheme});
}
