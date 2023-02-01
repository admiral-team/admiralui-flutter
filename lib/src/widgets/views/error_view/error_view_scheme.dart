import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class ErrorViewScheme {
  ErrorViewScheme({
    required this.theme,
  }) {
    titleColor = theme.colors.textSecondary;
    titleFont = theme.fonts.subhead4;
    backgroundColor = theme.colors.backgroundBasic;
    ghostButtonScheme = GhostButtonScheme(theme: theme);
  }

  AppTheme theme;
  late AColor titleColor;
  late AFont titleFont;
  late AColor backgroundColor;
  late GhostButtonScheme ghostButtonScheme;
}
