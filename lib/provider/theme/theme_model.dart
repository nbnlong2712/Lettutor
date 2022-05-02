import 'package:flutter/material.dart';
import 'package:flutter_lettutor/provider/theme/theme_preference.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemePreference _preferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreference();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}