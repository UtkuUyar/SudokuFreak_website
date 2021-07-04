import 'package:flutter/material.dart';
import 'package:sudokufreak/themes/customColorThemes.dart';

import '../widgets/FixedAppBar.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "/about";
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorThemes.primaryColorCustom,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            floating: false,
            pinned: false,
            titleTextStyle: Theme.of(context).textTheme.headline5,
            toolbarHeight: 100,
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Home',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  )
                ],
              ),
            ],
            title: Text(
              "Sudoku Freak",
              style:
                  Theme.of(context).textTheme.headline5?.copyWith(fontSize: 50),
            ),
          )
        ],
      ),
    );
  }
}
