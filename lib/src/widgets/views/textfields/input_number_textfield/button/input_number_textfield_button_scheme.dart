import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class InputNumberTextfieldButtonScheme {
  InputNumberTextfieldButtonScheme({
    required this.theme,
  }) {
    buttonColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.normal,
    );
    buttonColor.set(
      theme.colors.backgroundAdditionalOnePressed.color(),
      ControlState.highlighted,
    );
    buttonColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      ControlState.disabled,
    );

    imageColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    imageColor.set(
      theme.colors.elementAccentPressed.color(),
      ControlState.highlighted,
    );
    imageColor.set(
      theme.colors.elementAccentPressed.colorWithOpacity(),
      ControlState.selected,
    );
    imageColor.set(
      theme.colors.elementAccentPressed.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  ControlParameter<Color> imageColor = ControlParameter<Color>();
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
