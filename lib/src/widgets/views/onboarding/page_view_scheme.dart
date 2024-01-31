import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class PageViewScheme {
  PageViewScheme({
    required this.theme,
  }) {
    imageBackground = theme.colors.backgroundSelected;
    titleLabelFont = theme.fonts.largeTitle1;
    descriptionLabelTextColor = theme.colors.textSecondary;
    titleLabelColor = theme.colors.textPrimary;
    descriptionLabelTextFont = theme.fonts.body2;
  }

  AppTheme theme;
  late AColor imageBackground;
  late AFont titleLabelFont;
  late AColor titleLabelColor;
  late AColor descriptionLabelTextColor;
  late AFont descriptionLabelTextFont;
}
