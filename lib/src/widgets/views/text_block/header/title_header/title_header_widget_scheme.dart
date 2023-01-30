import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleHeaderWidgetScheme {
  TitleHeaderWidgetScheme({
    required this.theme,
  }) {
    font = theme.fonts.body1;
    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();
  }

  AppTheme theme;
  late AFont font;
  late Color textColor;
  late Color disabledTextColor;
}
