import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class CalendarVerticalPageViewScheme {
  CalendarVerticalPageViewScheme({
    required this.theme,
  }) {
    monthLabelFont = theme.fonts.subtitle1;
    monthLabelColor = theme.colors.textPrimary;
    dividerColor = theme.colors.elementAdditional;
    monthScheme = CalendarMonthViewScheme(theme: theme);
    weekScheme = CalendarWeekViewScheme(theme: theme);
  }

  AppTheme theme;
  late AFont monthLabelFont;
  late AColor monthLabelColor;
  late AColor dividerColor;
  late CalendarMonthViewScheme monthScheme;
  late CalendarWeekViewScheme weekScheme;
}
