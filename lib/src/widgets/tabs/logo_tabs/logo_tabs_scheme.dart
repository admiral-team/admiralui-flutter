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

    selectedBorderColor.set(
      theme.colors.elementAccent.color(),
      ControlState.normal,
    );
    selectedBorderColor.set(
      theme.colors.elementAccent.color(),
      ControlState.highlighted,
    );
    selectedBorderColor.set(
      theme.colors.elementAccent.colorWithOpacity(),
      ControlState.disabled,
    );

    borderColor.set(
      theme.colors.elementAdditional.color(),
      ControlState.normal,
    );
    borderColor.set(
      theme.colors.elementAdditional.color(),
      ControlState.highlighted,
    );
    borderColor.set(
      theme.colors.elementAdditional.colorWithOpacity(),
      ControlState.disabled,
    );
  }

  AppTheme theme;
  late Color labelColor;

  late ControlParameter<Color> borderColor = ControlParameter<Color>();
  late ControlParameter<Color> selectedBorderColor = ControlParameter<Color>();
  late Color backgroundColor;

  late AFont labelFont;
  late AFont unselectedLabelFont;
}
