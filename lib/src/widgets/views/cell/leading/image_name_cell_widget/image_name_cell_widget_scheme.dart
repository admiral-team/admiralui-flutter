import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ImageNameCellWidgetScheme {
  ImageNameCellWidgetScheme({
    required this.theme,
  }) {
    backgroundColor = theme.colors.backgroundSecondary.color();
    disabledBackgroundColor = theme.colors
    .backgroundSecondary.colorWithOpacity();

    textColor = theme.colors.textStaticWhite.color();
    disabledTextColor = theme.colors.textStaticWhite.colorWithOpacity();

    font = theme.fonts.subhead1;
  }

  AppTheme theme;
  late Color backgroundColor;
  late Color disabledBackgroundColor;

  late Color textColor;
  late Color disabledTextColor;

  late AFont font;
}
