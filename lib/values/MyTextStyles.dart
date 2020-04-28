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
  static const TextStyle DateText = TextStyle(
      fontSize: 22.0, color: MyColors.tp4, fontWeight: FontWeight.bold);

  static const TextStyle DateText1 = TextStyle(
      fontSize: 22.0, color: MyColors.tp7, fontWeight: FontWeight.bold);
  static const TextStyle DateText2 = TextStyle(
      fontSize: 22.0, color: MyColors.tp8, fontWeight: FontWeight.bold);

  static const TextStyle Highlight = TextStyle(
    color: MyColors.tp7,
    fontSize: 33.0,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.0,
  );
  static const TextStyle Today = TextStyle(
    color: MyColors.morning,
    fontSize: 28.0,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.0,
  );
  static const TextStyle WPHData = TextStyle(
      fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w700);
  static const TextStyle WPHText = TextStyle(
      fontSize: 23.0, color: Colors.white, fontWeight: FontWeight.w800);
  static const TextStyle DetailHead = TextStyle(
      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w800);
  static const TextStyle DetailsValue = TextStyle(
      fontSize: 20.0, color: MyColors.tp4, fontWeight: FontWeight.w800);
}
