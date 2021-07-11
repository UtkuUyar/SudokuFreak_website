import 'package:flutter/material.dart';

import './aboutScreen.dart';
import '../themes/customColorThemes.dart';
import '../widgets/logo.dart';
import '../widgets/imageDisplay.dart';
import '../widgets/onDragImageFileInput.dart';
import '../widgets/FixedAppBar.dart';
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
