import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TwoTitleGhostButtonScheme {
  TwoTitleGhostButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

    final ControlParameter<Color> defaultTextColor = ControlParameter<Color>();
    defaultTextColor.set(
      theme.colors.textAccent.color(),
      ControlState.normal,
    );
    defaultTextColor.set(
      theme.colors.textAccentPressed.color(),
      ControlState.highlighted,
    );
    defaultTextColor.set(
      theme.colors.textAccent.colorWithOpacity(),
      ControlState.disabled,
    );
    textColor = defaultTextColor;
  }

  AppTheme theme;
  late ControlParameter<Color> textColor = ControlParameter<Color>();
  late AFont font;
}
