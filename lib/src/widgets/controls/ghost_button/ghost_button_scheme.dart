import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class GhostButtonScheme {
  GhostButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;
    spinnerScheme = SpinnerScheme(theme: theme);

    buttonColor.set(
      theme.colors.textAccent.color(),
      ControlState.normal,
    );
    buttonColor.set(
      theme.colors.textAccentPressed.color(),
      ControlState.highlighted,
    );
    buttonColor.set(
      theme.colors.textAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AFont font;
  late SpinnerScheme spinnerScheme;
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
