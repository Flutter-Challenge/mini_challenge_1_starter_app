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
  // You can adjust this, as needed, but it should not change with the theme.
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
              waterColor: CustomWidgetThemes.of(context).sceneryThemeData!.waterFillColor,
              mountainColor: CustomWidgetThemes.of(context).sceneryThemeData!.mountainFillColor,
              textHeight: _textAreaHeight,
              drawSun: CustomWidgetThemes.of(context).sceneryThemeData!.drawSun,
              drawMoon: CustomWidgetThemes.of(context).sceneryThemeData!.drawMoon,
            ),
            child: Container(),
          ),
          //todo(you) - Can you find a way to toggle this text area color according to the theme?
          Positioned(
            bottom: 0,
            child: Container(
              height: _textAreaHeight,
              width: constraints.maxWidth,
              child: const SomeText(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: constraints.maxWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      //todo(you) Can you put the RadioListTile contentPadding in a theme?
                      child: RadioListTile<ThemeType>(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('Light'),
                        groupValue: myTheme.currentTheme,
                        value: ThemeType.Light,
                        onChanged: (ThemeType? type) => myTheme.setThemeType(ThemeType.Light),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('Dark'),
                        groupValue: myTheme.currentTheme,
                        value: ThemeType.Dark,
                        onChanged: (ThemeType? type) => myTheme.setThemeType(ThemeType.Dark),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('Pastel'),
                        groupValue: myTheme.currentTheme,
                        value: ThemeType.Pastel,
                        onChanged: (ThemeType? type) => myTheme.setThemeType(ThemeType.Pastel),
                      ),
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
