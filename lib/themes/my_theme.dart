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

  ThemeData get currentThemeData {
    switch (_themeType) {
      case ThemeType.Light:
        return ThemeData(
          primarySwatch: Colors.blue,
        );
      case ThemeType.Dark:
        return ThemeData(
          primarySwatch: Colors.blueGrey,
        );
      case ThemeType.Pastel:
        return ThemeData(
          primarySwatch: Colors.yellow,
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Pastel,
}
