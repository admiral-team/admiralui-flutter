import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class LinearPageControlScheme {
  LinearPageControlScheme({
    required this.theme,
  }) {
    backgroundColor.set(
      theme.colors.textSecondary.color(),
      ControlState.normal,
    );

    backgroundColor.set(
      theme.colors.textPrimary.color(),
      ControlState.selected,
    );

    backgroundColor.set(
      theme.colors.textPrimary.color(),
      ControlState.highlighted,
    );
  }

  AppTheme theme;
  late ControlParameter<Color> backgroundColor = ControlParameter<Color>();
}
