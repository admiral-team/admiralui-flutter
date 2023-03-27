import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class ParagraphWidgetScheme {
  ParagraphWidgetScheme({
    required this.theme,
  }) {
    font = theme.fonts.body2;

    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();
    secondaryTextColor = theme.colors.textSecondary.color();
    disabledSecondaryTextColor = theme.colors.textSecondary.colorWithOpacity();

    leadingImageColor = theme.colors.elementPrimary.color();
    disabledLeadingImageColor = theme.colors.elementPrimary.colorWithOpacity();
  }

  AppTheme theme;
  late AFont font;

  late Color textColor;
  late Color disabledTextColor;
  late Color secondaryTextColor;
  late Color disabledSecondaryTextColor;

  late Color leadingImageColor;
  late Color disabledLeadingImageColor;
}
