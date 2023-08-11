import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class ThemeModel extends ChangeNotifier {
  bool isDarkMode = false;
  bool systemTheme = true;
  bool exDarkMode = true;

  ThemeModel() {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    systemTheme = prefs.getBool('systemTheme') ?? systemTheme;
    if (systemTheme) {
      isDarkMode = ui.window.platformBrightness == ui.Brightness.dark;
    } else {
      isDarkMode = prefs.getBool('isDarkMode') ?? isDarkMode;
    }
    notifyListeners();
  }

  Future<void> _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    await prefs.setBool('systemTheme', systemTheme);
  }

  void initializeSystemThemeListener() {
    if (systemTheme == true && exDarkMode == true) {
      ui.window.onPlatformBrightnessChanged = () {
        isDarkMode = ui.window.platformBrightness == ui.Brightness.dark;
        notifyListeners();
      };
    }
  }

  void darkModeOn() {
    isDarkMode = true;
    exDarkMode = false;
    systemTheme = false;
    _saveThemePreference();
    notifyListeners();
  }

  void lightModeOn() {
    isDarkMode = false;
    exDarkMode = false;
    systemTheme = false;
    _saveThemePreference();
    notifyListeners();
  }

  void systemThemeOn() {
    systemTheme = true;
    exDarkMode = true;
    isDarkMode = ui.window.platformBrightness == ui.Brightness.dark;
    _saveThemePreference();
    notifyListeners();
  }
}
