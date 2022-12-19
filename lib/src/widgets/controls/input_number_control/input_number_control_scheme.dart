import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class InputNumberScheme {
  InputNumberScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

    inputTextColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );
    inputTextColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AFont font;
  ControlParameter<Color> inputTextColor = ControlParameter<Color>();
}
