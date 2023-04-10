import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/checkbox/checkbox_parameter.dart';
import 'package:flutter/material.dart';

class CheckboxScheme {
  CheckboxScheme({
    required this.theme,
  }) {
    textFont = theme.fonts.subhead4;

    textColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
      CheckboxStyle.normal,
    );
    textColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
      CheckboxStyle.normal,
    );
    textColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
      CheckboxStyle.error,
    );
    textColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
      CheckboxStyle.error,
    );

    checkboxColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
      CheckboxStyle.normal,
    );
    checkboxColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
      CheckboxStyle.normal,
    );
    checkboxColor.set(
      theme.colors.elementError.color(),
      ControlState.normal,
      CheckboxStyle.error,
    );
    checkboxColor.set(
      theme.colors.elementError.colorWithOpacity(),
      ControlState.disabled,
      CheckboxStyle.error,
    );
  }

  AppTheme theme;
  late AFont textFont;
  CheckboxParameter<Color> textColor = CheckboxParameter<Color>();
  CheckboxParameter<Color> checkboxColor = CheckboxParameter<Color>();
}
