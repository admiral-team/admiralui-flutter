import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class CalendarWeekViewScheme {
  CalendarWeekViewScheme({
    required this.theme,
  }) {
    titleLabelFont = theme.fonts.subhead2;
    titleLabelColor = theme.colors.textSecondary;
  }

  AppTheme theme;
  late AColor titleLabelColor;
  late AFont titleLabelFont;
}
