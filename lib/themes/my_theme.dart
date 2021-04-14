import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  MyTheme() {
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      // This callback gets invoked every time brightness changes
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeMode(ThemeMode.dark);
          break;
        case Brightness.light:
          setThemeMode(ThemeMode.light);
      }
    };
  }

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light and dark mode?
  ThemeData get currentThemeData {
    if (_themeMode == ThemeMode.light) {
      return ThemeData(brightness: Brightness.light, primaryColor: Colors.blue);
    } else {
      return ThemeData(brightness: Brightness.dark, primaryColor: Colors.green);
    }
  }
}
