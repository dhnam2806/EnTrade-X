import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/bloc/theme_bloc.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final success = state as ThemeInitial;
        return Switch(
          value: success.isDarkTheme,
          inactiveTrackColor: Colors.grey,
          activeColor: Theme.of(context).colorScheme.primary,
          onChanged: (bool value) async {
            value
                ? context
                    .read<ThemeBloc>()
                    .add(ThemeSwitchOnEvent(isDarkTheme: value))
                : context
                    .read<ThemeBloc>()
                    .add(ThemeSwitchOffEvent(isDarkTheme: value));
          },
        );
      },
    );
  }
}
