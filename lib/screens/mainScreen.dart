import 'package:flutter/material.dart';

import './aboutScreen.dart';
import '../themes/customColorThemes.dart';
import '../widgets/logo.dart';
import '../widgets/imageDisplay.dart';
import '../widgets/onDragImageFileInput.dart';
import '../widgets/FixedAppBar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorThemes.primaryColorCustom,
      body: CustomScrollView(
        slivers: <Widget>[
          FixedAppBar(
            pages: {AboutScreen.routeName: "About"},
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Container(
                        height: 500,
                        width: 500,
                        child: Logo(),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 500,
                        width: 1300,
                        child: Row(
                          children: [
                            Flexible(flex: 5, child: ImageDisplay()),
                            Flexible(flex: 8, child: OnDragImageFileInput()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
