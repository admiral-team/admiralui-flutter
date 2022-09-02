import 'package:admiralui_flutter/src/widgets/controls/control_parameter.dart';
import 'package:flutter/material.dart';

class PrimaryButtonScheme {
  PrimaryButtonScheme()
      : fontSize = 16,
        fontFamily = '.SF UI Display',
        fontWeight = FontWeight.w500 {
    textColor.set(const Color(0xFFFFFFFF), ControlState.normal);
    textColor.set(
        const Color(0xFFFFFFFF).withOpacity(0.6), ControlState.disabled);

    buttonColor.set(const Color(0xFF3A83F1), ControlState.normal);
    buttonColor.set(const Color(0xFF316FCC), ControlState.highlighted);
    buttonColor.set(
        const Color(0xFF3A83F1).withOpacity(0.6), ControlState.disabled);
  }

  double fontSize;
  String fontFamily;
  FontWeight fontWeight;
  ControlParameter<Color> textColor = ControlParameter<Color>();
  ControlParameter<Color> buttonColor = ControlParameter<Color>();

// TODO: when theme will done
// var _theme = theme ?? AppTheme.light;
}
