import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setThemeMode(themeMode) {
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
