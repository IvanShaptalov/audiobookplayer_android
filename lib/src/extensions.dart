import 'package:flutter/material.dart';

class Extensions {
  static Color setLvlColor(int lvl) {
    switch (lvl) {
      case 1:
        return Color.fromARGB(57, 122, 205, 130);
      case 2:
        return Color.fromARGB(57, 49, 76, 197);
      case 3:
        return Color.fromARGB(57, 190, 33, 193);
      default:
        return Color.fromARGB(57, 122, 205, 130);
    }
  }
}
