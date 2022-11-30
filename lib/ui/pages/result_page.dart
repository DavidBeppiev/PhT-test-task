import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  String imagePath;
  ResultPage({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
