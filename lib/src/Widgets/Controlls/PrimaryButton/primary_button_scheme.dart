import 'package:flutter/material.dart';

class PrimaryButtoScheme {
  final double fontSize = 16;
  final String fontFamily = '.SF UI Display';
  final FontWeight fontWeight = FontWeight.w500;
  final Color textColor = const Color(0xFFFFFFFF);
  final Color buttonColor = const Color(0x3A83F1);

  // const FontWrapper({
  //   required this.fontSize,
  //   required this.fontFamily,
  //   required this.fontWeight,
  // });

  TextStyle toTextStyle(double opacity) {
    return TextStyle(
      color: textColor.withOpacity(opacity),
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }
}
