import 'package:flutter/material.dart';

class FixedAppBar extends StatelessWidget {
  final Map<String, String> pages;
  FixedAppBar({Key? key, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      floating: false,
      pinned: false,
      titleTextStyle: Theme.of(context).textTheme.headline5,
      toolbarHeight: 100,
      actions: [
        ...pages.entries.map(
          (tuple) => Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(tuple.key),
                child: Text(
                  tuple.value,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 25,
              )
            ],
          ),
        ),
      ],
      title: Text(
        "Sudoku Freak",
        style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 50),
      ),
    );
  }
}
