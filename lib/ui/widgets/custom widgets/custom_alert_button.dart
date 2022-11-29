import 'package:fhysical_transformation/data/constants/my_colors.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';
import 'package:flutter/material.dart';

class MyCustomAlertButton extends StatelessWidget {
  Function() onPressed;
  String text;

  MyCustomAlertButton({required this.onPressed, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          ),
          backgroundColor: const MaterialStatePropertyAll<Color>(
            MyColors.sharkColor,
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(text.toUpperCase(), style: MyStyles.tsCLightningYellowFS18));
  }
}
