import 'package:admiralui_flutter/admiralui_flutter.dart';

class CalendarMonthViewScheme {
  CalendarMonthViewScheme({
    required this.theme,
  }) {
    dayScheme = CalendarDayViewScheme(theme: theme);
  }

  AppTheme theme;
  late CalendarDayViewScheme dayScheme;
}
