import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class PaddingWidgetScheme {
  PaddingWidgetScheme({
    required this.theme,
  }) {
    lineColor = theme.colors.elementAdditional.color();
  }

  AppTheme theme;

  late Color lineColor;
}
