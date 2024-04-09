import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class AdmiralFloatingButtonScheme {
  AdmiralFloatingButtonScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;
    backgroundColor = theme.colors.backgroundExtraSurface;
    shadowColor = theme.colors.backgroundShadow;
    iconColor = theme.colors.elementExtra;

    themeItemBackgroundColor.set(
      theme.colors.backgroundAdditionalOne.color(),
      ControlState.normal,
    );
    themeItemBackgroundColor.set(
      theme.colors.backgroundAccent.color(),
      ControlState.highlighted,
    );

    themeTextColor.set(
      theme.colors.textPrimary.color(),
      ControlState.normal,
    );
    themeTextColor.set(
      theme.colors.textStaticWhite.color(),
      ControlState.highlighted,
    );
  }

  AppTheme theme;
  late AFont font;
  late AColor backgroundColor;
  late AColor shadowColor;
  late AColor iconColor;
  late SpinnerScheme spinnerScheme;
  ControlParameter<Color> themeItemBackgroundColor = ControlParameter<Color>();
  ControlParameter<Color> themeTextColor = ControlParameter<Color>();
}
