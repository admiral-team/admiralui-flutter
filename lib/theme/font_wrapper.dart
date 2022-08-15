import 'package:flutter/material.dart';

class FontWrapper {
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;

  const FontWrapper({
    required this.fontSize,
    required this.fontFamily,
    required this.fontWeight,
  });

  TextStyle toTextStyle(Color color) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }
}
