import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class TextFieldAnimatedLabelScheme {
  TextFieldAnimatedLabelScheme({
    required this.theme,
  }) {
    errorColor = theme.colors.textError;
    tintColor = theme.colors.elementAccent;
    underlineColor = theme.colors.textSecondary;
    disabledColor = theme.colors.textSecondary.colorWithOpacity();
    focusedLabelFont = theme.fonts.subhead3;
    unfocucedLabelFont = theme.fonts.body1;
  }

  AppTheme theme;
  late AColor tintColor;
  late AColor underlineColor;
  late AColor errorColor;
  late Color disabledColor;
  late AFont focusedLabelFont;
  late AFont unfocucedLabelFont;
}
