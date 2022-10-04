import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class SecondaryButtonScheme {
  SecondaryButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

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
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
