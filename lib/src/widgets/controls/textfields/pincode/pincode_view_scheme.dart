import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class PincodeViewScheme {
  PincodeViewScheme({
    required this.theme,
  }) {
    numberLabelColor = theme.colors.textPrimary.color();
    titleFont = theme.fonts.numberTitle;
  }

  AppTheme theme;
  late Color numberLabelColor;
  late AFont titleFont;
}
