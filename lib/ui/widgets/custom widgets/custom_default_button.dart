import 'package:fhysical_transformation/data/constants/my_colors.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';
import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  Function() onPressed;
  String text;

  CustomDefaultButton({required this.onPressed, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 7.0),
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
            ),
            backgroundColor: const MaterialStatePropertyAll<Color>(
              MyColors.lightningYellow,
            ),
          ),
          onPressed: onPressed,
          child: Text(text.toUpperCase(), style: MyStyles.tsCSharkFS26,)),
    );
  }
}
