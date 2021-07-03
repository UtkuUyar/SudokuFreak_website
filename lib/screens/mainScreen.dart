import 'package:flutter/material.dart';

import '../themes/customColorThemes.dart';
import '../widgets/logo.dart';
import '../widgets/onDragImageFileInput.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorThemes.primaryColorCustom,
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      //   shadowColor: Color.fromRGBO(255, 255, 255, 0),
      // ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    child: Logo(),
                  ),
                  Container(
                    height: 500,
                    width: 1300,
                    child: OnDragImageFileInput(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
