import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ArrowListWidgetScheme {
  ArrowListWidgetScheme({
    required this.theme,
  }) {
    tintColor = theme.colors.elementSecondary.color();
    disabledTintColor = theme.colors.elementSecondary.colorWithOpacity();
  }

  AppTheme theme;
  late Color tintColor;
  late Color disabledTintColor;
}
