import 'package:fhysical_transformation/data/constants/my_colors.dart';
import 'package:flutter/cupertino.dart';

abstract class MyStyles {
  static const test = TextStyle(
      fontFamily: 'JosefinSans', fontWeight: FontWeight.w900, color: MyColors.ironColor, fontSize: 34);

  static const tsCsharkFS26 = TextStyle(
    fontFamily: 'JosefinSans',
    color: MyColors.sharkColor,
    fontSize: 26,
    letterSpacing: 1.2,
  );

  static const tsClightningYellowFS18 = TextStyle(color: MyColors.lightningYellow, fontSize: 18, letterSpacing: 1.1);
}
