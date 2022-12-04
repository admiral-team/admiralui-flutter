import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class CheckboxScheme {
  CheckboxScheme({
    required this.theme,
  }) {
    textStyle = theme.fonts.subhead4.toTextStyle(
      theme.colors.textPrimary.color(),
    );

    checkboxColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    checkboxColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late TextStyle textStyle;
  ControlParameter<Color> checkboxColor = ControlParameter<Color>();
}
