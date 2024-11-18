import 'package:flutter/material.dart';

class AFont {
  const AFont({
    required this.fontSize,
    required this.fontFamily,
    required this.fontWeight,
  });

  factory AFont.fromJson(Map<String, dynamic> json) {
    return AFont(
      fontSize: json['fontSize'],
      fontFamily: json['fontFamily'],
      fontWeight: FontWeight.values[json['fontWeight']],
    );
  }

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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fontSize': fontSize,
      'fontFamily': fontFamily,
      'fontWeight': fontWeight.index,
    };
  }
}
