import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/imageProvider.dart';
import './themes/customColorThemes.dart';
import './screens/aboutScreen.dart';
import './screens/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageCarrier>(
      create: (ctx) => ImageCarrier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: CustomColorThemes.logoPinkColorCustom,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(
                headline6: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
              .apply(
                displayColor: CustomColorThemes.secondaryColorCustom,
                bodyColor: CustomColorThemes.secondaryColorCustom,
              ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
