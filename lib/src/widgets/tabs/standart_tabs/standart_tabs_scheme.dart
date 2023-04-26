import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class StandartTabsScheme {
  StandartTabsScheme({
    required this.theme,
  }) {
    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.color();

    backgroundColor = theme.colors.backgroundBasic.color();

    textFont = theme.fonts.subhead2;
    unselectedTextFont = theme.fonts.subhead3;

    selectedBorderColor = theme.colors.elementAccent.color();
    disabledSelectedBorderColor = theme.colors.elementAccent.colorWithOpacity();

    borderColor = theme.colors.elementAdditional.color();
    disabledBorderColor = theme.colors.elementAdditional.colorWithOpacity();
  }

  AppTheme theme;
  late Color textColor;
  late Color disabledTextColor;

  late Color borderColor;
  late Color disabledBorderColor;

  late Color selectedBorderColor;
  late Color disabledSelectedBorderColor;

  late Color backgroundColor;

  late AFont textFont;
  late AFont unselectedTextFont;
}
