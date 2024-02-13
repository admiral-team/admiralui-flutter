import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class PlatformButtonScheme {
  PlatformButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

    textColor.set(
      theme.colors.backgroundBasic.color(),
      ControlState.normal,
    );
    textColor.set(
      theme.colors.backgroundBasic.colorWithOpacity(),
      ControlState.disabled,
    );

    buttonColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );
    buttonColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.highlighted,
    );
    buttonColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AFont font;
  ControlParameter<Color> textColor = ControlParameter<Color>();
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
