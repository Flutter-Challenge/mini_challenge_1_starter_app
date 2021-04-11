import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SceneryPainter.dart';
import 'themes/custom_themes.dart';
import 'themes/my_theme.dart';

class Scenery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  // You can adjust this, if you like, but it should not toggle with light/dark mode.
  final _textAreaHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    final myTheme = Provider.of<MyTheme>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomPaint(
            foregroundPainter: SceneryPainter(
              skyColor: CustomWidgetThemes.of(context).sceneryThemeData!.skyFillColor,
              petalFillColor: CustomWidgetThemes.of(context).sceneryThemeData!.petalFillColor,
              petalStrokeColor: CustomWidgetThemes.of(context).sceneryThemeData!.petalStrokeColor,
              stemColor: CustomWidgetThemes.of(context).sceneryThemeData!.stemStrokeColor,
              midPointX: constraints.maxWidth / 2,
              textHeight: _textAreaHeight,
              drawSun: CustomWidgetThemes.of(context).sceneryThemeData!.drawSun,
              drawMoon: CustomWidgetThemes.of(context).sceneryThemeData!.drawMoon,
            ),
            child: Container(
              color: CustomWidgetThemes.of(context).sceneryThemeData!.groundFillColor,
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
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 200,
                height: 200,
                child: Column(
                  children: <Widget>[
                    RadioListTile<ThemeType>(
                      title: const Text('Light Theme'),
                      groupValue: myTheme.currentTheme,
                      value: ThemeType.Light,
                      onChanged: (ThemeType? type) => myTheme.setThemeType(ThemeType.Light),
                    ),
                    RadioListTile<ThemeType>(
                      title: const Text('Dark Theme'),
                      groupValue: myTheme.currentTheme,
                      value: ThemeType.Dark,
                      onChanged: (ThemeType? type) => myTheme.setThemeType(ThemeType.Dark),
                    ),
                    RadioListTile<ThemeType>(
                      title: const Text('Pastel Theme'),
                      groupValue: myTheme.currentTheme,
                      value: ThemeType.Pastel,
                      onChanged: (ThemeType? type) => myTheme.setThemeType(ThemeType.Pastel),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //todo(you) - Can you find a way to toggle this value with light mode and dark mode.
  final _textBackgroundColor = Colors.blueGrey.shade50;
}

class SomeText extends StatelessWidget {
  const SomeText();
  @override
  Widget build(BuildContext context) {
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
