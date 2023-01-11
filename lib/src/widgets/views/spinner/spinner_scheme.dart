import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';

class SpinnerScheme {
  SpinnerScheme({
    required this.theme,
  }) {
    defaultColor = theme.colors.backgroundAccent;
    contrastColor = theme.colors.elementStaticWhite;
  }

  AppTheme theme;
  late AColor defaultColor;
  late AColor contrastColor;
}
