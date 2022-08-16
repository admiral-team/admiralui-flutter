import 'package:flutter/material.dart';
import '../controll_parameter.dart';

class GhostButtonScheme {
  double fontSize;
  String fontFamily;
  FontWeight fontWeight;
  ControlParameter<Color> buttonColor = ControlParameter<Color>();

  GhostButtonScheme()
      : fontSize = 16,
        fontFamily = '.SF UI Display',
        fontWeight = FontWeight.w500 {
    buttonColor.set(const Color(0xFF3A83F1), ControlState.normal);
    buttonColor.set(const Color(0xFF316FCC), ControlState.highlighted);
    buttonColor.set(
        const Color(0xFF3A83F1).withOpacity(0.6), ControlState.disabled);
  }
}
