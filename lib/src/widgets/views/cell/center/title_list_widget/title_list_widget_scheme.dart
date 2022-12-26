import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleListWidgetScheme {
  TitleListWidgetScheme({
    required this.theme,
  }) {
    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();
    font = theme.fonts.body1;
  }

  AppTheme theme;
  late AFont font;
  late Color textColor;
  late Color disabledTextColor;
}
