import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

//  PinCodeItemScheme - the visual scheme of PinCodeItem.
//  You can create a by specifying the following parameters in init:
//  - PinCodeItemScheme() - Initialize default PinCodeItemScheme with 
//  default themezation.
class PinCodeItemScheme {
  PinCodeItemScheme({
    required this.theme,
  }) {
    // Normal
    backgroundColor.set(
      theme.colors.elementAdditional.color(),
      CodeInputStatus.normal,
    );

    // Active
    activeColor = theme.colors.elementAccent.color();

    // Error
    backgroundColor.set(
      theme.colors.elementError.color(),
      CodeInputStatus.error,
    );

    // Success
    backgroundColor.set(
      theme.colors.elementSuccess.color(),
      CodeInputStatus.success,
    );
  }

  AppTheme theme;
  PinCodeItemParameters<Color> backgroundColor = PinCodeItemParameters<Color>();
  late Color activeColor;
}
