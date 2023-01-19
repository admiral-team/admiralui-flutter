import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class GhostButtonScheme {
  GhostButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;
    spinnerScheme = SpinnerScheme(theme: theme);

    buttonColor.set(
      const Color(0xFF3A83F1),
      ControlState.normal,
    );
    buttonColor.set(
      const Color(0xFF316FCC),
      ControlState.highlighted,
    );
    buttonColor.set(
      const Color(0xFF3A83F1).withOpacity(0.6),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AFont font;
  late SpinnerScheme spinnerScheme;
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
