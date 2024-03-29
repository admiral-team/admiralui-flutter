import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleButtonDropDownWidgetScheme {
  TitleButtonDropDownWidgetScheme({
    required this.theme,
  }) {
    ghostButtonScheme = ButtonArrowWidgetScheme(theme: theme);
    titleColor = theme.colors.textSecondary.color();
    disabledTitleColor = theme.colors.textSecondary.colorWithOpacity();
    font = theme.fonts.title1;
  }

  AppTheme theme;
  late ButtonArrowWidgetScheme ghostButtonScheme;
  late Color titleColor;
  late Color disabledTitleColor;
  late AFont font;
}
