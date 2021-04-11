import 'package:flutter/material.dart';

/// Theme for the Scenery
class SceneryTheme extends InheritedTheme {
  const SceneryTheme({
    required this.data,
    required this.child,
  }) : super(child: child);

  final SceneryThemeData data;
  final Widget child;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SceneryTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(covariant SceneryTheme oldWidget) {
    return data != oldWidget.data;
  }
}

/// Theme data for the Scenery
class SceneryThemeData {
  SceneryThemeData({
    required this.skyFillColor,
    required this.mountainFillColor,
    required this.waterFillColor,
    required this.drawMoon,
    required this.drawSun,
  });

  final Color skyFillColor;

  final Color mountainFillColor;

  final Color waterFillColor;

  final bool drawSun;

  final bool drawMoon;
}
