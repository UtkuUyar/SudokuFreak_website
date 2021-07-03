import 'package:flutter/material.dart';

import '../themes/customColorThemes.dart';
import '../widgets/logo.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorThemes.primaryColorCustom,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Logo(
              width: 250.0,
              height: 225.0,
            )
          ],
        ),
      ),
    );
  }
}
