import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class CurrencyHeaderScheme {
  CurrencyHeaderScheme({
    required this.theme,
  }) {
    textColor = theme.colors.textSecondary;
    textFont = theme.fonts.subhead3;
  }

  AppTheme theme;
  late AColor textColor;
  late AFont textFont;
}
