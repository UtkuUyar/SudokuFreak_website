import 'package:flutter/material.dart';

class CustomColorThemes {
  static const Map<int, Color> _primaryColorMap = {
    50: Color.fromRGBO(247, 244, 242, .1),
    100: Color.fromRGBO(247, 244, 242, .2),
    200: Color.fromRGBO(247, 244, 242, .3),
    300: Color.fromRGBO(247, 244, 242, .4),
    400: Color.fromRGBO(247, 244, 242, .5),
    500: Color.fromRGBO(247, 244, 242, .6),
    600: Color.fromRGBO(247, 244, 242, .7),
    700: Color.fromRGBO(247, 244, 242, .8),
    800: Color.fromRGBO(247, 244, 242, .9),
    900: Color.fromRGBO(247, 244, 242, 1),
  };

  static const Map<int, Color> _secondaryColorMap = {
    50: Color.fromRGBO(22, 22, 22, .1),
    100: Color.fromRGBO(22, 22, 22, .2),
    200: Color.fromRGBO(22, 22, 22, .3),
    300: Color.fromRGBO(22, 22, 22, .4),
    400: Color.fromRGBO(22, 22, 22, .5),
    500: Color.fromRGBO(22, 22, 22, .6),
    600: Color.fromRGBO(22, 22, 22, .7),
    700: Color.fromRGBO(22, 22, 22, .8),
    800: Color.fromRGBO(22, 22, 22, .9),
    900: Color.fromRGBO(22, 22, 22, 1),
  };

  static const Map<int, Color> _logoPinkColorMap = {
    50: Color.fromRGBO(229, 183, 210, .1),
    100: Color.fromRGBO(229, 183, 210, .2),
    200: Color.fromRGBO(229, 183, 210, .3),
    300: Color.fromRGBO(229, 183, 210, .4),
    400: Color.fromRGBO(229, 183, 210, .5),
    500: Color.fromRGBO(229, 183, 210, .6),
    600: Color.fromRGBO(229, 183, 210, .7),
    700: Color.fromRGBO(229, 183, 210, .8),
    800: Color.fromRGBO(229, 183, 210, .9),
    900: Color.fromRGBO(229, 183, 210, 1),
  };

  static const MaterialColor primaryColorCustom =
      MaterialColor(0xFFF7F4F2, _primaryColorMap);
  static const MaterialColor secondaryColorCustom =
      MaterialColor(0xFF161616, _secondaryColorMap);
  static const MaterialColor logoPinkColorCustom =
      MaterialColor(0xFFe5b7d2, _logoPinkColorMap);
}
