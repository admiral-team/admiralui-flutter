import 'package:flutter/material.dart';

class AppThemeStorage extends ChangeNotifier {
  AppThemeStorage._internal();

  factory AppThemeStorage() {
    return _shared;
  }
  bool _themeButtonHidden = false;
  bool get isButtonHidden => _themeButtonHidden;

  static final AppThemeStorage _shared = AppThemeStorage._internal();

  void toggleButton() async {
    _themeButtonHidden = await _themeButtonHidden ? false : true;
    notifyListeners();
  }
}
