import 'package:flutter/material.dart';

import '../themes/customColorThemes.dart';
import '../widgets/mainScreenContent.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorThemes.primaryColorCustom,
      body: MainScreenContent(),
    );
  }
}
