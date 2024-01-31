import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class DropDownHeaderScheme {
  DropDownHeaderScheme({
    required this.theme,
  }) {
    titleFont = theme.fonts.title1;
    subtitleFont = theme.fonts.subtitle1;
    headlineFont = theme.fonts.headline;

    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();

    headlineTextColor = theme.colors.textSecondary.color();
    disabledHeadlineTextColor = theme.colors.textSecondary.colorWithOpacity();

    imageColor = theme.colors.elementAdditional.color();
    disabledImageColor = theme.colors.elementAdditional.colorWithOpacity();
  }

  AppTheme theme;
  late AFont titleFont;
  late AFont subtitleFont;
  late AFont headlineFont;

  late Color textColor;
  late Color disabledTextColor;

  late Color headlineTextColor;
  late Color disabledHeadlineTextColor;

  late Color imageColor;
  late Color disabledImageColor;
}
