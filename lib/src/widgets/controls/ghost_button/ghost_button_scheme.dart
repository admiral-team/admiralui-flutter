import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class GhostButtonScheme {
  GhostButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

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
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
