import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme light = AppTheme();
}

class BaseCellScheme {
  Color selectedColor;
  Color deafultColor;
  Color disabledColor;

  BaseCellScheme({AppTheme? theme})
      : selectedColor = const Color(0x0febf3fe),
        deafultColor = const Color(0xFFFFFFFF),
        disabledColor = const Color(0xFFFFFFFF).withOpacity(0.5);
}
