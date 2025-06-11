import 'package:app_anotacoes/util/preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeCodeConfig { system, light, dark }

class ThemeConfig extends ChangeNotifier {
  ThemeCodeConfig _theme = ThemeCodeConfig.system;

  void setTheme(ThemeCodeConfig code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PreferencesKeys.themeCode, code.name);
    _theme = code;
    notifyListeners();
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? code = prefs.getString(PreferencesKeys.themeCode);

    _theme = ThemeCodeConfig.values.firstWhere(
      (value) => value.name == code,
      orElse: () => ThemeCodeConfig.system,
    );
  }

  ThemeCodeConfig getThemeCode() {
    return _theme;
  }

  ThemeMode getThemeMode() {
    switch (_theme) {
      case ThemeCodeConfig.system:
        return ThemeMode.system;
      case ThemeCodeConfig.light:
        return ThemeMode.light;
      case ThemeCodeConfig.dark:
        return ThemeMode.dark;
    }
  }
}
