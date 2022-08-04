import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme light = AppTheme();
}

class PrimaryButtonScheme {
  double fontSize;
  String fontFamily;
  FontWeight fontWeight;
  Color normalTextColor;
  Color disableTextColor;
  Color buttonNormalColor;
  Color buttonDisableColor;
  Color buttonHighLightColor;

  PrimaryButtonScheme({AppTheme? theme})
      : fontSize = 16,
        fontFamily = '.SF UI Display',
        fontWeight = FontWeight.w500,
        normalTextColor = const Color(0xFFFFFFFF),
        disableTextColor = const Color(0xFFFFFFFF).withOpacity(0.6),
        buttonNormalColor = const Color(0xFF3A83F1),
        buttonDisableColor = const Color(0xFF3A83F1).withOpacity(0.6),
        buttonHighLightColor = const Color(0xFF3A83F1).withOpacity(0.6);
  // TODO: when theme will done
  // var _theme = theme ?? AppTheme.light;

  TextStyle normalTextStyle() {
    return TextStyle(
      color: normalTextColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }

  TextStyle disableTextStyle() {
    return TextStyle(
      color: disableTextColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }
}
