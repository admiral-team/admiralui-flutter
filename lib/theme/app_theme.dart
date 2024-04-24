import 'package:admiralui_flutter/admiralui_flutter.dart';

class AppTheme {
  const AppTheme({
    required this.name,
    required this.colors,
    required this.fonts,
  });

  final String name;
  final ColorPalette colors;
  final FontPalette fonts;
}

const AppTheme lightTheme = AppTheme(
  name: 'Basic - Light',
  colors: lightPalette,
  fonts: defaultFontPalette,
);

const AppTheme darkTheme = AppTheme(
  name: 'Basic - Dark',
  colors: darkPalette,
  fonts: defaultFontPalette,
);
