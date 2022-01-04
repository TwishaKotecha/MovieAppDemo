import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorsFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorsFromHex(hexColor));
}

//Color color1 = HexColor("b74093");
//Color color2 = HexColor("b74093");
//Color color3 = HexColor("#88b74093");
