import 'package:bmi_calculator/calculatorBMI.dart';
import 'package:bmi_calculator/components/button_bottom.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
//  ResultPage(
//      {this.textResult: 'asdasd',
//      this.result: 69,
//      this.advice: 'hace ejercicio'});
//  ResultPage({@required this.yourBMI});

  CalculatorBMI yourBMI;
//  final String textResult;
//  final double result;
//  final String advice;

  @override
  Widget build(BuildContext context) {
    yourBMI = ModalRoute.of(context).settings.arguments as CalculatorBMI;
    return Scaffold(
        appBar: AppBar(title: Text('CALCULADORA IMC')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                'TU RESULTADO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: ReusableCard(
                colour: kInactiveBackgroundContainerColour,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      yourBMI.getResultBMI().toUpperCase(),
                      style:
                          TextStyle(color: Colors.green.shade400, fontSize: 25),
                    ),
                    Text(
                      yourBMI.calculateBMI().toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      yourBMI.getAdviceBMI(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonText: 'RE-CALCULAR',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
