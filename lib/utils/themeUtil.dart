import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeUtil {
  static isLightModeEnabled() {
    return SchedulerBinding.instance.window.platformBrightness == Brightness.light;
  }

  static getSystemTheme(bool isLightThemeEnabled) {
    return isLightThemeEnabled ? ThemeMode.light : ThemeMode.dark;
  }
}
