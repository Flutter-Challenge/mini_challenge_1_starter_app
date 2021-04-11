import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  ThemeType _themeType = ThemeType.Light;

  setThemeType(ThemeType newTheme) {
    _themeType = newTheme;
    notifyListeners();
  }

  ThemeType get currentTheme {
    return _themeType;
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better
  ThemeData get currentThemeData {
    switch (_themeType) {
      case ThemeType.Light:
        return ThemeData();
      case ThemeType.Dark:
        return ThemeData();
      case ThemeType.Pastel:
        return ThemeData();
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Pastel,
}
