import 'package:flutter/material.dart';

import './themes/customColorThemes.dart';
import './screens/aboutScreen.dart';
import './screens/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CustomColorThemes.logoPinkColorCustom,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: CustomColorThemes.secondaryColorCustom,
              bodyColor: CustomColorThemes.secondaryColorCustom,
            ),
      ),
      home: MainScreen(),
    );
  }
}
