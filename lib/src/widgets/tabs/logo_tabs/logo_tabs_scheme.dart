import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class LogoTabsScheme {
  LogoTabsScheme({
    required this.theme,
  }) {
    labelColor = theme.colors.textPrimary.color();
    backgroundColor = theme.colors.backgroundBasic.color();

    labelFont = theme.fonts.subhead2;
    unselectedLabelFont = theme.fonts.subhead3;

    borderColor.set(
      theme.colors.elementAccent.color(),
      ControlState.highlighted,
    );
    borderColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late Color labelColor;
  late ControlParameter<Color> borderColor = ControlParameter<Color>();
  late Color backgroundColor;

  late AFont labelFont;
  late AFont unselectedLabelFont;
}
