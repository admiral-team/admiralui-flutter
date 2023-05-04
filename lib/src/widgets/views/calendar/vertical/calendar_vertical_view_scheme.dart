import 'package:admiralui_flutter/admiralui_flutter.dart';

class CalendarVerticalViewScheme {
  CalendarVerticalViewScheme({
    required this.theme,
  }) {
    pageViewScheme = CalendarVerticalPageViewScheme(theme: theme);
  }

  AppTheme theme;
  late CalendarVerticalPageViewScheme pageViewScheme;
}
