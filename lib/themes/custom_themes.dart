import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  // todo(you) These colors are dreary! Modify this so the picture has different values for light and dark modes
  CustomWidgetThemes._(BuildContext context) {
    final themeMode = Provider.of<MyTheme>(context).themeMode;
    if (Theme.of(context).brightness == Brightness.light) {
      //themeMode == ThemeMode.light) {
      sceneryThemeData = SceneryThemeData(
        skyFillColor: Colors.grey,
        mountainFillColor: Colors.blueGrey,
        waterFillColor: Colors.blueGrey[800]!,
        drawMoon: false,
        drawSun: true,
      );
    } else {
      sceneryThemeData = SceneryThemeData(
        skyFillColor: Colors.grey,
        mountainFillColor: Colors.blueGrey,
        waterFillColor: Colors.blueGrey[800]!,
        drawMoon: true,
        drawSun: false,
      );
    }
  }
}
