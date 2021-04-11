import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  CustomWidgetThemes._(BuildContext context) {
    final theme = Provider.of<MyTheme>(context).currentTheme;
    switch (theme) {
      // todo(you) These colors are dreary! Modify this so the picture it has different values for light, dark and pastel mode
      //If you are feeling ambitious, add another ThemeType or two
      case ThemeType.Light:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.grey,
          mountainFillColor: Colors.blueGrey,
          waterFillColor: Colors.blueGrey[800]!,
          drawMoon: false,
          drawSun: true,
        );
        break;
      case ThemeType.Dark:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.grey,
          mountainFillColor: Colors.blueGrey,
          waterFillColor: Colors.blueGrey[800]!,
          drawMoon: true,
          drawSun: false,
        );
        break;
      case ThemeType.Pastel:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.grey,
          mountainFillColor: Colors.blueGrey,
          waterFillColor: Colors.blueGrey[800]!,
          drawMoon: true,
          drawSun: true,
        );
        break;
    }
  }
}
