import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ToolbarWidgetScheme {
  ToolbarWidgetScheme({
    required this.theme,
  }) {
    font = theme.fonts.caption2;

    textColor = theme.colors.textStaticWhite.color();
    selectedTextColor = theme.colors.textAccent.color();

    imageColor = theme.colors.elementStaticWhite.color();
    selectedImageColor = theme.colors.elementAccent.color();

    backgroundColor = theme.colors.backgroundAccentDark.color();
  }

  AppTheme theme;
  late AFont font;
  late Color textColor;
  late Color selectedTextColor;
  late Color imageColor;
  late Color selectedImageColor;
  late Color backgroundColor;
}
