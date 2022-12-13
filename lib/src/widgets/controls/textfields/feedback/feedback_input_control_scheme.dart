import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class FeedbackInputControlScheme {
  FeedbackInputControlScheme({
    required this.theme,
  }) {
    defaultColor.set(
      theme.colors.elementAdditional.color(),
      ControlState.normal,
    );
    defaultColor.set(
      theme.colors.elementAdditional.colorWithOpacity(),
      ControlState.disabled,
    );

    selectedColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    selectedColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  ControlParameter<Color> defaultColor = ControlParameter<Color>();
  ControlParameter<Color> selectedColor = ControlParameter<Color>();
}
