import 'package:flutter/material.dart';
import 'MyColors.dart';

class MyTextStyles {
  static const TextStyle title = TextStyle(
      fontFamily: 'QuickSand',
      fontSize: 45.0,
      color: MyColors.text1,
      fontWeight: FontWeight.bold);
  static const TextStyle titlewhite = TextStyle(
      fontFamily: 'QuickSand',
      fontSize: 45.0,
      color: Colors.white,
      fontWeight: FontWeight.bold);
  static const TextStyle bodyText = TextStyle(
      fontSize: 20.0, color: MyColors.text1, fontWeight: FontWeight.bold);
  static const TextStyle bodyTextwhite = TextStyle(
      fontSize: 20.0, color: MyColors.color1, fontWeight: FontWeight.bold);
  static const TextStyle bodyText2 = TextStyle(color: Colors.white);
}
