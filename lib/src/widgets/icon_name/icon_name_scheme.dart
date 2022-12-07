import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class IconNameScheme {
  IconNameScheme({
    required this.theme,
  }) {
    backgroundColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    backgroundColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  ControlParameter<Color> backgroundColor = ControlParameter<Color>();
}
