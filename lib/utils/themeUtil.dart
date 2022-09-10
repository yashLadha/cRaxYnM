import 'package:flutter/material.dart';

class ThemeUtil {
  static isLightModeEnabled(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.light;
  }

  static getSystemTheme(bool isLightThemeEnabled) {
    return isLightThemeEnabled ? ThemeMode.light : ThemeMode.dark;
  }
}
