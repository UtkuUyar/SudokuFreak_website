import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: constraints.maxWidth * 0.56,
            height: constraints.maxHeight * 0.56,
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
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
