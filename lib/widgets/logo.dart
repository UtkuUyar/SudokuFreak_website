import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;

  Logo({
    Key? key,
    required double this.width,
    required double this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          child: SvgPicture.asset(
            "assets/svg/logo.svg",
            semanticsLabel: "SudokuFreak Logo",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Container(
            child: Text(
          "Sudoku Freak",
          style: TextStyle(
            fontFamily: "Yellowtail",
            fontSize: 59,
          ),
        )),
        SizedBox(height: 10),
        Container(
          child: Text(
            "An AI that is really into sudoku puzzles!",
            style: TextStyle(
              fontFamily: "Raleway",
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
