import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class InputNumberButtonScheme {
  InputNumberButtonScheme({
    required this.theme,
  }) {
    // Normal
    buttonColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.normal,
      InputNumberButtonStyle.normal,
    );
    buttonColor.set(
      theme.colors.backgroundAdditionalOnePressed.color(),
      ControlState.highlighted,
      InputNumberButtonStyle.normal,
    );
    buttonColor.set(
      theme.colors.backgroundAdditionalOne.colorWithOpacity(),
      ControlState.disabled,
      InputNumberButtonStyle.normal,
    );
    imageColor.set(
      theme.colors.elementPrimary.color(),
      ControlState.normal,
      InputNumberButtonStyle.normal,
    );
    imageColor.set(
      theme.colors.elementPrimary.colorWithOpacity(),
      ControlState.disabled,
      InputNumberButtonStyle.normal,
    );

    // Secondary
    buttonColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
      InputNumberButtonStyle.secondary,
    );
    buttonColor.set(
      theme.colors.elementAccentPressed.color(),
      ControlState.highlighted,
      InputNumberButtonStyle.secondary,
    );
    buttonColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
      InputNumberButtonStyle.secondary,
    );
    imageColor.set(
      theme.colors.elementAccentPressed.color(),
      ControlState.normal,
      InputNumberButtonStyle.secondary,
    );
    imageColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
      InputNumberButtonStyle.secondary,
    );
  }

  AppTheme theme;
  InputNumberButtonParameters<Color> imageColor =
      InputNumberButtonParameters<Color>();
  InputNumberButtonParameters<Color> buttonColor =
      InputNumberButtonParameters<Color>();
}
