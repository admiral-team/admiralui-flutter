import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

class TitleMoreDetailTextMessageWidgetScheme {
  TitleMoreDetailTextMessageWidgetScheme({
    required this.theme,
  }) {
    titleColor = theme.colors.textPrimary.color();
    disabledTitleColor = theme.colors.textPrimary.colorWithOpacity();
    titleFont = theme.fonts.body1;

    moreColor = theme.colors.textSecondary.color();
    disabledMoreColor = theme.colors.textSecondary.colorWithOpacity();
    moreFont = theme.fonts.subhead3;

    detaileColor = theme.colors.textAccent.color();
    disabledDetaileColor = theme.colors.textAccent.colorWithOpacity();
    detaileFont = theme.fonts.subtitle2;

    detaileMoreColor = theme.colors.textAccentAdditional.color();
    disabledDetaileMoreColor = theme.colors
    .textAccentAdditional.colorWithOpacity();
    detaileMoreFont = theme.fonts.subhead3;

    subtitleColor = theme.colors.textSecondary.color();
    disabledSubtitleColor = theme.colors.textSecondary.colorWithOpacity();
    subtitleFont = theme.fonts.subhead3;

    tagTextColor = theme.colors.textSecondary.color();
    disabledTagTextColor = theme.colors.textSecondary.colorWithOpacity();
    tagTextFont = theme.fonts.caption2;

    messageTextColor = theme.colors.textPrimary.color();
    disabledMessageTextColor = theme.colors.textPrimary.colorWithOpacity();
    messageTextFont = theme.fonts.subhead4;

    iconInfoColor = theme.colors.elementPrimary.color();
    disabledIconInfoColor = theme.colors.elementPrimary.colorWithOpacity();

    tagBackgroundColor = theme.colors.backgroundAdditionalOne.color();
    disabledTagBackgroundColor = theme.colors
    .backgroundAdditionalOne.colorWithOpacity();
  }

  AppTheme theme;

  late AFont titleFont;
  late Color titleColor;
  late Color disabledTitleColor;

  late AFont moreFont;
  late Color moreColor;
  late Color disabledMoreColor;

  late AFont detaileFont;
  late Color detaileColor;
  late Color disabledDetaileColor;

  late AFont detaileMoreFont;
  late Color detaileMoreColor;
  late Color disabledDetaileMoreColor;

  late AFont subtitleFont;
  late Color subtitleColor;
  late Color disabledSubtitleColor;

  late AFont tagTextFont;
  late Color tagTextColor;
  late Color disabledTagTextColor;

  late AFont messageTextFont;
  late Color messageTextColor;
  late Color disabledMessageTextColor;

  late Color iconInfoColor;
  late Color disabledIconInfoColor;

  late Color tagBackgroundColor;
  late Color disabledTagBackgroundColor;
}
