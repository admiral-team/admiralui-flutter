import 'package:flutter/material.dart';

class AFont {
  const AFont({
    required this.fontSize,
    required this.fontFamily,
    required this.fontWeight,
  });

  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;

  TextStyle toTextStyle(Color color) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }
}
