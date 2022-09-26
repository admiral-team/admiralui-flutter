import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class RadioButtonScheme {
  RadioButtonScheme({
    required this.theme,
  }) {
    textStyle = theme.fonts.subhead4.toTextStyle(
      theme.colors.textPrimary.color(),
    );

    radioColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    radioColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late TextStyle textStyle;
  ControlParameter<Color> radioColor = ControlParameter<Color>();
}
