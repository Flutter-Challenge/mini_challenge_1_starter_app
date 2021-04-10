import 'package:flutter/material.dart';

import 'SceneryPainter.dart';
import 'themes/custom_themes.dart';

class Scenery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  // You can adjust this, if you like, but it should not toggle with light/dark mode.
  final _textAreaHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomPaint(
            foregroundPainter: SceneryPainter(
              skyColor: CustomThemes.of(context).sceneryThemeData!.skyFillColor,
              petalFillColor: CustomThemes.of(context).sceneryThemeData!.petalFillColor,
              petalStrokeColor: CustomThemes.of(context).sceneryThemeData!.petalStrokeColor,
              stemColor: CustomThemes.of(context).sceneryThemeData!.stemStrokeColor,
              groundColor: CustomThemes.of(context).sceneryThemeData!.groundFillColor,
              midPointX: constraints.maxWidth / 2,
              textHeight: _textAreaHeight,
              drawSun: _drawSun,
              drawMoon: _drawMoon,
            ),
            child: Container(
              color: CustomThemes.of(context).sceneryThemeData!.groundFillColor,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: _textAreaHeight,
              width: constraints.maxWidth,
              color: _textBackgroundColor,
              child: const SomeText(),
            ),
          ),
        ],
      ),
    );
  }

  //todo(you) - Can you find a way to toggle these values with light mode and dark mode.
  final _textBackgroundColor = Colors.blueGrey.shade50;
  final _drawMoon = true;
  final _drawSun = true;
}

class SomeText extends StatelessWidget {
  const SomeText();
  @override
  Widget build(BuildContext context) {
    //todo(you) - Required - Can you make this text more interesting with a custom AppTheme?
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Flaiku',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Anonymous',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8),
        Text(
          'Hello, Flutter Friend!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'Welcome to Flutter Challenge',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'We hope you have fun :)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
