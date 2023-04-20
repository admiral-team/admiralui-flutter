import 'package:admiralui_flutter/admiralui_flutter.dart';

class CalendarHorizontalViewScheme {
  CalendarHorizontalViewScheme({
    required this.theme,
  }) {
    monthScheme = CalendarMonthViewScheme(theme: theme);
    weekScheme = CalendarWeekViewScheme(theme: theme);
  }

  AppTheme theme;
  late CalendarMonthViewScheme monthScheme;
  late CalendarWeekViewScheme weekScheme;
}
