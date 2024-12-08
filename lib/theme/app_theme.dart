import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/colors_palette_json.dart';
import 'package:admiralui_flutter/theme/font_pallete_json.dart';

class AppTheme {
  
  const AppTheme({
    required this.name,
    required this.colors,
    required this.fonts,
  });

  factory AppTheme.fromJson(Map<String, dynamic> json) {
    return AppTheme(
      name: json['name'],
      colors: ColorPaletteJson.fromJson(json['colors']),
      fonts: FontPaletteJson.fromJson(json['fonts']),
    );
  }

  final String name;
  final ColorPalette colors;
  final FontPalette fonts;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'colors': colors.toJson(),
      'fonts': fonts.toJson(),
    };
  }
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
