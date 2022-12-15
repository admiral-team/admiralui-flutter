import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class CurrencyScheme {
  CurrencyScheme({
    required this.theme,
  }) {
    textColor = theme.colors.textPrimary;
    textFont = theme.fonts.body1;
    imageTintColor = theme.colors.elementPrimary;
  }

  AppTheme theme;
  late AColor textColor;
  late AColor imageTintColor;
  late AFont textFont;
}
