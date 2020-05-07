import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
//#1E1F33
//        brightness: Brightness.dark,
          accentColor: Color(0xFF1E1F33),
          buttonColor: Color(0xFFEA1556),
          primaryColor: Color(0xFF090C22),
          scaffoldBackgroundColor: Color(0xFF090C22),
          textTheme: TextTheme(
              body1: TextStyle(
            color: Color(0xFFFFFFFF),
          ))),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        'resultPage': (context) => ResultPage(),
      },
    );
  }
}
