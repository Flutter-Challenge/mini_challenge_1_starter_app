import 'package:flutter/material.dart';
import 'package:mini_challenge_1_theming/scenery.dart';
import 'package:mini_challenge_1_theming/themes/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MyTheme>(
      create: (_) => MyTheme(),
      child: LayoutBuilder(
        builder: (context, constraints) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming Mini Challenge',
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyTheme>(context).currentThemeData,
      home: MyHomePage(title: 'Theming Mini Challenge'),
=======
      theme: ThemeData(
        textTheme:
            TextTheme(), // todo(you) fill this TextTheme() in to make the text look nicer
      ),
      home: MyHomePage(title: 'Theming Challenge'),
>>>>>>> 72b0a768cc4257bf97b48b24a1b04a08fa151177
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scenery(),
    );
  }
}
