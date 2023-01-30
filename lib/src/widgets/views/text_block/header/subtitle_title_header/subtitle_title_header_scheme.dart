import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class SubtitleTitleWidgetScheme {
  SubtitleTitleWidgetScheme({
    required this.theme,
  }) {
    titleStyleTitleFont = theme.fonts.title1;
    titleStyleSubtitleFont = theme.fonts.subtitle1;
    titleStyleHeadlineFont = theme.fonts.headline;

    subtitleStyleTitleFont = theme.fonts.body2;
    subtitleStyleSubtitleFont = theme.fonts.body2;
    subtitleStyleHeadlineFont = theme.fonts.headline;

    textColor = theme.colors.textPrimary.color();
    disabledTextColor = theme.colors.textPrimary.colorWithOpacity();

    subtextColor = theme.colors.textSecondary.color();
    disabledSubtextColor = theme.colors.textSecondary.colorWithOpacity();

    headlineTextColor = theme.colors.textSecondary.color();
    disabledHeadlineTextColor = theme.colors.textSecondary.colorWithOpacity();
  }

  AppTheme theme;
  late AFont titleStyleTitleFont;
  late AFont titleStyleSubtitleFont;
  late AFont titleStyleHeadlineFont;

  late AFont subtitleStyleTitleFont;
  late AFont subtitleStyleSubtitleFont;
  late AFont subtitleStyleHeadlineFont;

  late Color textColor;
  late Color disabledTextColor;

  late Color subtextColor;
  late Color disabledSubtextColor;

  late Color headlineTextColor;
  late Color disabledHeadlineTextColor;
}
