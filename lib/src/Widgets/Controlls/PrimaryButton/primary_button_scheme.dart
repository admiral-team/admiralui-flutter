import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme light = AppTheme();
}

class PrimaryButtonScheme {
  double fontSize;
  String fontFamily;
  FontWeight fontWeight;
  Color textColorNormal;
  Color textColorDisabled;
  Color buttonColorNormal;
  Color buttonColorDisabled;
  Color buttonColorHighLight;

  PrimaryButtonScheme({AppTheme? theme})
      : fontSize = 16,
        fontFamily = '.SF UI Display',
        fontWeight = FontWeight.w500,
        textColorNormal = const Color(0xFFFFFFFF),
        textColorDisabled = const Color(0xFFFFFFFF).withOpacity(0.6),
        buttonColorNormal = const Color(0xFF3A83F1),
        buttonColorDisabled = const Color(0xFF3A83F1).withOpacity(0.6),
        buttonColorHighLight = const Color(0xFF3A83F1).withOpacity(0.6);
  // TODO: when theme will done
  // var _theme = theme ?? AppTheme.light;

  TextStyle normalTextStyle() {
    return TextStyle(
      color: textColorNormal,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }

  TextStyle disableTextStyle() {
    return TextStyle(
      color: textColorDisabled,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }
}
