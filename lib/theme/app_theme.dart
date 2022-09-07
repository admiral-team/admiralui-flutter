import 'package:admiralui_flutter/admiralui_flutter.dart';

class AppTheme {
  const AppTheme({
    required this.colors,
    required this.fonts,
  });

  final ColorPalette colors;
  final FontPalette fonts;
}

const AppTheme lightTheme = AppTheme(
  colors: lightPalette,
  fonts: defaultFontPalette,
);

const AppTheme darkTheme = AppTheme(
  colors: darkPalette,
  fonts: defaultFontPalette,
);
