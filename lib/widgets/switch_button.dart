import 'package:entradex/theme/bloc/app_theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDarkTheme,
          inactiveTrackColor: Colors.grey,
          activeColor: Theme.of(context).colorScheme.primary,
          onChanged: (bool value) async {
            value
                ? context
                    .read<AppThemeBloc>()
                    .add(ThemeChangeEvent(isDarkTheme: value))
                : context
                    .read<AppThemeBloc>()
                    .add(ThemeChangeEvent(isDarkTheme: value));
          },
        );
      },
    );
  }
}
