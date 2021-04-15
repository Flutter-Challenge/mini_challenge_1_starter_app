import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
            primaryColor: Colors.lime,
            primaryColorLight: Color(0xff96cdf0),
            accentColor: Color(0xff182628),
            backgroundColor: Color(0xff3b945e),
            textTheme: TextTheme(
                headline3: TextStyle(
                    color: Color(0xff0E1132), fontWeight: FontWeight.bold),
                subtitle1: TextStyle(
                    color: Color(0xff0E1132), fontWeight: FontWeight.w600),
                bodyText1: TextStyle(color: Color(0xff04396C))));
      case ThemeType.Dark:
        return ThemeData(
            primaryColor: Color(0xff10282d),
            primaryColorLight: Color(0xff4E4E50),
            accentColor: Color(0xffe1f1f4),
            backgroundColor: Color(0xff182628),
            textTheme: TextTheme(
                headline3: TextStyle(
                    color: Color(0xffffffff), fontWeight: FontWeight.bold),
                subtitle1: TextStyle(
                    color: Color(0xffffffff), fontWeight: FontWeight.w600),
                bodyText1: TextStyle(color: Color(0xebEDF5E0))));
      case ThemeType.Other:
        return ThemeData(
            primaryColor: Colors.pink[100],
            primaryColorLight: Colors.deepPurpleAccent[100],
            accentColor: Color(0xff2a1b3d),
            textTheme: TextTheme(
                headline3: TextStyle(
                    color: Color(0xff25274D), fontWeight: FontWeight.bold),
                subtitle1: TextStyle(
                    color: Color(0xff25274D), fontWeight: FontWeight.w600),
                bodyText1: TextStyle(color: Color(0xff24315E))));
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
