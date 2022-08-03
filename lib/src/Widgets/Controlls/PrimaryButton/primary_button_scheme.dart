import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme light = AppTheme();
}

class PrimaryButtonScheme {
  double opacity = 0.6;
  double fontSize = 16;
  String fontFamily = '.SF UI Display';
  FontWeight fontWeight = FontWeight.w500;
  Color normalTextColor = const Color(0xFFFFFFFF);
  Color buttonNormalColor = const Color(0xFF3A83F1);
  late Color buttonDisableColor = const Color(0xFF3A83F1).withOpacity(opacity);
  late Color buttonHighLightColor =
      const Color(0xFF3A83F1).withOpacity(opacity);

  PrimaryButtonScheme({AppTheme? theme = null}) {
    var _theme = theme ?? AppTheme.light;
  }

  TextStyle toNormalTextStyle() {
    return TextStyle(
      color: normalTextColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }

  TextStyle toDisableTextStyle() {
    return TextStyle(
      color: normalTextColor.withOpacity(opacity),
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );
  }
}
