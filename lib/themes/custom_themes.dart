import 'package:flutter/material.dart';

import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  CustomWidgetThemes._(BuildContext context) {
    //todo(you) Modify this so that it has different values for light and dark mode
    sceneryThemeData = SceneryThemeData(
      skyFillColor: Colors.lightBlueAccent.shade200,
      groundFillColor: Colors.green.shade800,
      petalFillColor: Colors.pinkAccent.shade100,
      petalStrokeColor: Colors.pink.shade50,
      stemStrokeColor: Colors.lightGreen.shade600,
      drawMoon: false,
      drawSun: true,
    );
  }
}
