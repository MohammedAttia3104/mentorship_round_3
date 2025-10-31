/// Extension for hex color
/// Usage: Color myColor = "#FFFFFF".toColor();
library;

import 'package:flutter/material.dart';

extension HexColorExtension on String {
  Color toColor() {
    String hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    throw FormatException("Invalid hex color format");
  }
}
