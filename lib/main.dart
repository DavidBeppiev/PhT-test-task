import 'package:fhysical_transformation/ui/pages/initial_page.dart';
import 'package:fhysical_transformation/data/constants/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.ironColor
      ),
      title: 'Flutter Demo',
      home: const InitialPage(),
    );
  }
}