import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class CalendarHorizontalViewScheme {
  CalendarHorizontalViewScheme({
    required this.theme,
  }) {
    datePickerTextColor = theme.colors.textPrimary;
    datePickerFont = theme.fonts.title2;
    monthScheme = CalendarMonthViewScheme(theme: theme);
    weekScheme = CalendarWeekViewScheme(theme: theme);
  }

  AppTheme theme;
  late AColor datePickerTextColor;
  late AFont datePickerFont;
  late CalendarMonthViewScheme monthScheme;
  late CalendarWeekViewScheme weekScheme;
}
