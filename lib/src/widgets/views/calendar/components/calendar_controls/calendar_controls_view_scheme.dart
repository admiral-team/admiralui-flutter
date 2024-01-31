import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class CalendarControlsViewScheme {
  CalendarControlsViewScheme({
    required this.theme,
  }) {
    font = theme.fonts.subtitle1;
    textColor = theme.colors.textAccent;
  }

  AppTheme theme;
  late AColor textColor;
  late AFont font;
}
