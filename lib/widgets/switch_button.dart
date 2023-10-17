import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/bloc/theme_bloc.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final success = state as ThemeInitial;
        return Switch(
          // This bool value toggles the switch.
          value: success.isDarkTheme,
          activeColor: Theme.of(context).colorScheme.primary,
          onChanged: (bool value) async {
            SharedPreferences _theme = await SharedPreferences.getInstance();
            await _theme.setBool('isDarkTheme', value);
            // This is called when the user toggles the switch.
            value
                ? context.read<ThemeBloc>().add(ThemeSwitchOnEvent(isDarkTheme: _theme.getBool('isDarkTheme')!))
                : context.read<ThemeBloc>().add(ThemeSwitchOffEvent(isDarkTheme: _theme.getBool('isDarkTheme')!));
          },
        );
      },
    );
  }
}
