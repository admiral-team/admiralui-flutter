import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LogoTabsScheme {
  LogoTabsScheme({
    required this.theme,
  }) {
    labelColor = theme.colors.textPrimary.color();
    borderColor = theme.colors.elementAccent.color();
    backgroundColor = theme.colors.backgroundBasic.color();

    labelFont = theme.fonts.subhead2;
    unselectedLabelFont = theme.fonts.subhead3;
  }

  AppTheme theme;
  late Color labelColor;
  late Color borderColor;
  late Color backgroundColor;

  late AFont labelFont;
  late AFont unselectedLabelFont;
}
