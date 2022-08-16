import 'package:admiralui_flutter/theme/colors_palette.dart';
import 'package:admiralui_flutter/theme/font_palette.dart';

class AppTheme {
  final ColorPalette colors;
  final FontPalette fonts;

  const AppTheme({
    required this.colors,
    required this.fonts,
  });

  static const defaultTheme = darkTheme;

  static const AppTheme lightTheme = AppTheme(
    colors: lightPalette,
    fonts: defaultFontPalette,
  );

  static const AppTheme darkTheme = AppTheme(
    colors: darkPalette,
    fonts: defaultFontPalette,
  );
}
