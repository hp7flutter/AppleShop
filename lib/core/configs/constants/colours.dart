import 'package:flutter/material.dart';

class Colours {
  static const Color lightBlue = Color(0xff58AEE8);
  static const Color darkBlue = Color(0xff3B5EDF);
  static const Color lightGrey = Color(0xffEEEEEE);
  static const Color darkGrey = Color(0xff858585);
  static const Color green = Color(0xff1DB68B);
  static const Color darkGreen = Color(0xff004703);
  static const Color red = Color(0xffD02026);
  static const Color orange = Color(0xffFBAD40);
  static const Color yellow = Color(0xffFFBF00);
  static const Color black = Color(0xff393939);
  static const Color magenta = Color(0xffE858DA);

  static const Color white = Color(0xffFFFFFF);

  static Color hex(String hexColor) {
    hexColor = hexColor.replaceAll(' ', '').replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else if (hexColor.length != 8) {
      hexColor = 'FF000000';
    }

    return Color(int.tryParse(hexColor, radix: 16) ?? 0xFF000000);
  }
}
