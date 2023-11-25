import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme:AppBarTheme(
          backgroundColor: Color(kBackgroundColour),
        ),
        scaffoldBackgroundColor: Color(kBackgroundColour),
      ),
      home: InputPage(),
    );
  }
}

