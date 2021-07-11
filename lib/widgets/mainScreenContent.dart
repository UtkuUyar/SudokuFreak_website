import 'package:flutter/material.dart';

import '../screens/aboutScreen.dart';
import '../themes/customColorThemes.dart';
import '../widgets/logo.dart';
import '../widgets/imageDisplay.dart';
import '../widgets/onDragImageFileInput.dart';
import '../widgets/FixedAppBar.dart';

class MainScreenContent extends StatefulWidget {
  const MainScreenContent({Key? key}) : super(key: key);

  @override
  _MainScreenContentState createState() => _MainScreenContentState();
}

class _MainScreenContentState extends State<MainScreenContent> {
  bool _createPopup = false;

  void triggerPopup() => setState(
        () {
          this._createPopup = true;
        },
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              color: this._createPopup
                  ? Colors.black.withAlpha(192)
                  : Colors.transparent,
            ),
            child: CustomScrollView(
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
                                  Flexible(
                                    flex: 8,
                                    child: OnDragImageFileInput(
                                      processCallback: triggerPopup,
                                    ),
                                  ),
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
          ),
          if (this._createPopup)
            Container(
              height: constraints.maxHeight * 0.9,
              width: constraints.maxWidth * 0.8,
              constraints: BoxConstraints(
                minHeight: 500,
                minWidth: 500,
              ),
              child: Card(),
            ),
        ],
      );
    });
  }
}
