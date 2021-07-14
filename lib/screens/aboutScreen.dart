import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudokufreak/themes/customColorThemes.dart';
import 'package:sudokufreak/widgets/logo.dart';

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
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            <Widget>[
              Center(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 180, vertical: 0),
                              child: Text(
                                "About Me",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(fontSize: 40),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  child: CircleAvatar(
                                    radius: 200,
                                    backgroundImage: AssetImage(
                                      "images/my_image.jpeg",
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Hello, I'm Utku! I'm currently a CE junior student at Istanbul Technical University. I spent last 1.5 years learning " +
                                        "Machine Learning, Deep Learning, Flutter and Python. And now, I want to put all my knowledge into a simple yet entertaining project. " +
                                        "That is why I created this AI powered sudoku solver!",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 0,
                              ),
                              child: Text(
                                "About Sudoku Freak",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(fontSize: 40),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 400,
                                    alignment: Alignment.centerLeft,
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        ...[
                                          "Front-end is built with Flutter.",
                                          "For Back-end that is responsible from holding the learned weights for image detection and solving the sudoku, Python and Flask are used to create a simple API.",
                                          "For image detection, a simple Convolutional Network with YOLO algorithm is used.",
                                        ].map(
                                          (e) => ListTile(
                                            leading: Bullet(
                                              width: 15,
                                              height: 15,
                                            ),
                                            title: Text(
                                              e,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                              overflow: TextOverflow.visible,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  width: 300,
                                  child: SvgPicture.asset(
                                    "assets/svg/logo.svg",
                                    semanticsLabel: "SudokuFreak Logo",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  final double height;
  final double width;

  Bullet({
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
