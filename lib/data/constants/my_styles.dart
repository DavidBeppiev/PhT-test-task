import 'package:fhysical_transformation/data/constants/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MyStyles {
  static const tsCIronFS34 = TextStyle(
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w900,
      color: MyColors.ironColor,
      fontSize: 34,
      letterSpacing: 2.3);

  static const tsCSharkFS26 = TextStyle(
    fontFamily: 'JosefinSans',
    color: MyColors.sharkColor,
    fontSize: 26,
    letterSpacing: 1.2,
  );

  static const tsCLightningYellowFS18 =
      TextStyle(color: MyColors.lightningYellow, fontSize: 18, letterSpacing: 1.1);

  static const tsCIronFS28 = TextStyle(
      fontFamily: 'JosefinSans',
      color: MyColors.lightningYellow,
      fontSize: 28,);

  static const tsCIronFS22 = TextStyle(
      fontFamily: 'JosefinSans',
      color: MyColors.lightningYellow,
      fontSize: 22,);

  static const tsCBlueFS18 =
  TextStyle(color: Colors.blue, fontSize: 18, letterSpacing: 1.1);
}
