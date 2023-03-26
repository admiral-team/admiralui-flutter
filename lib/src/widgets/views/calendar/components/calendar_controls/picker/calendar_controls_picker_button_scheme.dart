import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class CalendarControlsPickerButtonScheme {
  CalendarControlsPickerButtonScheme({
    required this.theme,
  }) {
    
    buttonColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    buttonColor.set(
      theme.colors.elementAccentPressed.color(),
      ControlState.highlighted,
    );
    buttonColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
