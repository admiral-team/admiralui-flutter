import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class CalendarChooseButtonScheme {
  CalendarChooseButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.subtitle3;

    textColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    textColor.set(
      theme.colors.elementAccentPressed.color(),
      ControlState.highlighted,
    );
    textColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late AFont font;

  ControlParameter<Color> textColor = ControlParameter<Color>();
}
