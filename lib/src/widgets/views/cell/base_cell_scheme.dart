import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BaseCellScheme {
  BaseCellScheme({
    required this.theme,
  }) {
    selectedColor = theme.colors.textPrimary.colorWithOpacity(opacity: 0.1);
    defaultColor = theme.colors.backgroundBasic.color();
    disabledColor = theme.colors.backgroundBasic.colorWithOpacity();
  }

  AppTheme theme;
  late Color selectedColor;
  late Color defaultColor;
  late Color disabledColor;
}
