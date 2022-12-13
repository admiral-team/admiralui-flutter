import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/radio_button/radio_button_parameter.dart';
import 'package:flutter/material.dart';

class RadioButtonScheme {
  RadioButtonScheme({
    required this.theme,
  }) {
    textFont = theme.fonts.subhead4;

    textColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
      RadioButtonStyle.normal,
    );
    textColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
      RadioButtonStyle.normal,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
      RadioButtonStyle.error,
    );
    textColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      ControlState.disabled,
      RadioButtonStyle.error,
    );

    radioColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
      RadioButtonStyle.normal,
    );
    radioColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
      RadioButtonStyle.normal,
    );

    radioColor.set(
      theme.colors.elementError.color(),
      ControlState.normal,
      RadioButtonStyle.error,
    );
    radioColor.set(
      theme.colors.elementError.colorWithOpacity(),
      ControlState.disabled,
      RadioButtonStyle.error,
    );
  }

  AppTheme theme;
  late AFont textFont;
  RadioButtonParameter<Color> textColor = RadioButtonParameter<Color>();
  RadioButtonParameter<Color> radioColor = RadioButtonParameter<Color>();
}
