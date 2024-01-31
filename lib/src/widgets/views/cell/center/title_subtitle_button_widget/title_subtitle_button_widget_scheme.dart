import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleSubtitleButtonWidgetScheme {
  TitleSubtitleButtonWidgetScheme({
    required this.theme,
  }) {
    titleColor = theme.colors.textPrimary.color();
    disabledTitleColor = theme.colors.textPrimary.colorWithOpacity();
    titleFont = theme.fonts.body1;

    subtitleColor = theme.colors.textPrimary.color();
    disabledSubtitleColor = theme.colors.textPrimary.colorWithOpacity();
    subtitleFont = theme.fonts.subhead4;

    tagTextColor = theme.colors.textSecondary.color();
    disabledTagTextColor = theme.colors.textSecondary.colorWithOpacity();
    tagTextFont = theme.fonts.caption2;

    subtitleTwoColor = theme.colors.textSecondary.color();
    disabledSubtitleTwoColor = theme.colors.textSecondary.colorWithOpacity();
    subtitleTwoFont = theme.fonts.subhead4;

    tagBackgroundColor = theme.colors.backgroundAdditionalOne.color();
    disabledTagBackgroundColor =
        theme.colors.backgroundAdditionalOne.colorWithOpacity();

    buttonScheme = LinkControlScheme(theme: theme);
  }

  AppTheme theme;

  late AFont titleFont;
  late Color titleColor;
  late Color disabledTitleColor;

  late AFont subtitleFont;
  late Color subtitleColor;
  late Color disabledSubtitleColor;

  late AFont tagTextFont;
  late Color tagTextColor;
  late Color disabledTagTextColor;

  late AFont subtitleTwoFont;
  late Color subtitleTwoColor;
  late Color disabledSubtitleTwoColor;

  late Color tagBackgroundColor;
  late Color disabledTagBackgroundColor;

  late LinkControlScheme buttonScheme;
}
