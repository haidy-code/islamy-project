import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String applang = 'en';
  ThemeMode apptheme = ThemeMode.light;

  void changelanguage(String langcode) {
    if (langcode == applang) {
      return;
    }
    applang = langcode;
    notifyListeners();
  }

  void changetheme(ThemeMode mode) {
    if (mode == apptheme) {
      return;
    }
    apptheme = mode;
    notifyListeners();
  }
}
