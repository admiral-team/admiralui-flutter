import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ImageBackgroundCellWidgetScheme {
  ImageBackgroundCellWidgetScheme({
    required this.theme,
  }) {
    backgroundColor = theme.colors.backgroundAdditionalOne.color();
    disabledBackgroundColor = theme.colors
    .backgroundAdditionalOne.colorWithOpacity();

    tintColor = theme.colors.elementAccent.color();
    disabledTintColor = theme.colors.elementAccent.colorWithOpacity();
  }

  AppTheme theme;
  late Color backgroundColor;
  late Color disabledBackgroundColor;

  late Color tintColor;
  late Color disabledTintColor;
}
