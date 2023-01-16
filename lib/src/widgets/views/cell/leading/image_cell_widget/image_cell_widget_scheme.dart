import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ImageCellWidgetScheme {
  ImageCellWidgetScheme({
    required this.theme,
  }) {
    tintColor = theme.colors.elementAccent.color();
    disabledTintColor = theme.colors.elementAccent.colorWithOpacity();
  }

  AppTheme theme;
  late Color tintColor;
  late Color disabledTintColor;
}
