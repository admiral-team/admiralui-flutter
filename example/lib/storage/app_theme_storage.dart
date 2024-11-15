import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeStorage extends ChangeNotifier {

  factory AppThemeStorage() {
    return _shared;
  }

  AppThemeStorage._internal();
  bool _themeButtonHidden = false;
  bool get isButtonHidden => _themeButtonHidden;
  int _themeCount = 0;
  int get themeCount => _themeCount;

  static final AppThemeStorage _shared = AppThemeStorage._internal();

  void toggleButton() async {
    _themeButtonHidden = await _themeButtonHidden ? false : true;
    notifyListeners();
  }

  void setThemeButtonHidden(bool isHidden) async {
      _themeButtonHidden = await isHidden;
      notifyListeners();
  }

  Future<void> saveTheme(AppTheme theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String themeJson = jsonEncode(theme.toJson());
    await prefs.setString(theme.name, themeJson);
    await _updateThemeCount();
  }

  Future<void> deleteTheme(String themeName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(themeName);
    await _updateThemeCount();
  }

  Future<AppTheme?> getTheme(String themeName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? themeJson = prefs.getString(themeName);
    if (themeJson == null) return null;
    
    final Map<String, dynamic> themeMap = jsonDecode(themeJson);
    return AppTheme.fromJson(themeMap);
  }

  Future<List<AppTheme>> getAllThemes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<AppTheme> themes = <AppTheme>[];
    
    final Set<String> keys = prefs.getKeys();
    
    for (String key in keys) {
      try {
      final String? themeJson = prefs.getString(key);
      if (themeJson != null) {
        final Map<String, dynamic> themeMap = jsonDecode(themeJson);
        themes.add(AppTheme.fromJson(themeMap));
      }
      } catch (error) {}
    }

    return themes;
  }

  Future<void> _updateThemeCount() async {
    final List<AppTheme> themes = await getAllThemes();
    _themeCount = themes.length;
    notifyListeners();
  }
}
