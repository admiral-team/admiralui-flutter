import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme light = AppTheme();
}

class BaseCellScheme {
  BaseCellScheme()
      : selectedColor = const Color(0x0febf3fe),
        defaultColor = const Color(0xFFFFFFFF),
        disabledColor = const Color(0xFFFFFFFF).withOpacity(0.5);

  Color selectedColor;
  Color defaultColor;
  Color disabledColor;
}
