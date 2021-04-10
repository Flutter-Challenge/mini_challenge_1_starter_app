import 'package:flutter/material.dart';

import 'scenery_theme.dart';

class CustomThemes {
  static CustomThemes of(BuildContext context) => CustomThemes._privateConstructor(context);

  SceneryThemeData? sceneryThemeData;

  CustomThemes._privateConstructor(BuildContext context) {
    sceneryThemeData = SceneryThemeData(
      skyFillColor: Colors.lightBlueAccent.shade200,
      groundFillColor: Colors.green.shade800,
      petalFillColor: Colors.pinkAccent.shade100,
      petalStrokeColor: Colors.pink.shade50,
      stemStrokeColor: Colors.lightGreen.shade600,
    );
  }
}
