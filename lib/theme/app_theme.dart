import 'package:admiralui_flutter/theme/color_palette.dart';
import 'package:admiralui_flutter/theme/font_palette.dart';

class AppTheme {
  final ColorPalette colors;
  final FontPalette fonts;

  const AppTheme({
    required this.colors,
    required this.fonts,
  });

  static const defaultTheme = darkTheme;
}

const lightTheme = AppTheme(
  colors: lightPalette,
  fonts: defaultFontPalette,
);

const darkTheme = AppTheme(
  colors: darkPalette,
  fonts: defaultFontPalette,
);
