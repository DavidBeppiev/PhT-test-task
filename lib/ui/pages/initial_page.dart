import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(MyTexts.test, style: MyStyles.test),
        ),
      ),
    );
  }
}
