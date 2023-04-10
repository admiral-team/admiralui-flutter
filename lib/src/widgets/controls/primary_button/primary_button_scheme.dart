import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class PrimaryButtonScheme {
  PrimaryButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;

    textColor.set(
      theme.colors.textStaticWhite.color(),
      ControlState.normal,
    );
    textColor.set(
      theme.colors.textStaticWhite.colorWithOpacity(),
      ControlState.disabled,
    );

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
  late AFont font;
  ControlParameter<Color> textColor = ControlParameter<Color>();
  ControlParameter<Color> buttonColor = ControlParameter<Color>();
}
