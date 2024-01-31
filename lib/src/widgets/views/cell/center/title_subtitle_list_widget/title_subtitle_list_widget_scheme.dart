import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleSubtitleCellWidgetScheme {
  TitleSubtitleCellWidgetScheme({
    required this.theme,
  }) {
    titleColor = theme.colors.textPrimary.color();
    disabledTitleColor = theme.colors.textPrimary.colorWithOpacity();
    titleFont = theme.fonts.body1;

    subtitleColor = theme.colors.textSecondary.color();
    disabledSubtitleColor = theme.colors.textSecondary.colorWithOpacity();
    subtitleFont = theme.fonts.subhead4;
  }

  AppTheme theme;
  late AFont titleFont;
  late AFont subtitleFont;
  late Color titleColor;
  late Color disabledTitleColor;
  late Color subtitleColor;
  late Color disabledSubtitleColor;
}
