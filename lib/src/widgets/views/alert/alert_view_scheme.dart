import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class AlertViewScheme {
  AlertViewScheme({
    required this.theme,
  }) {
    titleColor = theme.colors.textPrimary;
    titleFont = theme.fonts.largeTitle1;
    descriptionColor = theme.colors.textSecondary;
    descriptionFont = theme.fonts.subhead3;
    backgroundColor = theme.colors.backgroundBasic;
  }

  AppTheme theme;
  late AColor titleColor;
  late AFont titleFont;
  late AColor descriptionColor;
  late AFont descriptionFont;
  late AColor backgroundColor;
}
