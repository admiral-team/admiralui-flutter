import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class SubtitleImageCellWidgetScheme {
  SubtitleImageCellWidgetScheme({
    required this.theme,
  }) {
    textColor = theme.colors.textSecondary.color();
    disabledTextColor = theme.colors.textSecondary.colorWithOpacity();
    font = theme.fonts.subhead3;
  }

  AppTheme theme;
  late Color textColor;
  late Color disabledTextColor;
  late AFont font;
}
