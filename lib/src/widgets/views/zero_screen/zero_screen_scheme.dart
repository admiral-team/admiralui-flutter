import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class ZeroScreenScheme {
  ZeroScreenScheme({
    required this.theme,
  }) {
    backgroundColor = theme.colors.backgroundBasic;

    titleColor = theme.colors.textPrimary;
    titleFont = theme.fonts.title1;

    subtitleColor = theme.colors.textSecondary;
    subtitleFont = theme.fonts.body2;

    primaryButtonScheme = PrimaryButtonScheme(theme: theme);
  }

  AppTheme theme;

  late AColor backgroundColor;
  late AColor titleColor;
  late AColor subtitleColor;

  late AFont subtitleFont;
  late AFont titleFont;

  late PrimaryButtonScheme primaryButtonScheme;
}
