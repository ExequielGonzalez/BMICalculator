import 'package:bmi_calculator/calculatorBMI.dart';
import 'package:bmi_calculator/components/weight_age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/gender_icon.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/button_bottom.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 180;

  BodyWeightAge weight = BodyWeightAge(60);
  BodyWeightAge age = BodyWeightAge(30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveBackgroundContainerColour
                        : kInactiveBackgroundContainerColour,
                    childWidget: GenderIcon(
                      genderText: 'HOMBRE',
                      genderIcon: FontAwesomeIcons.mars,
                      isActive: (selectedGender == Gender.male),
                    ),
                    onPressedWidget: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveBackgroundContainerColour
                        : kInactiveBackgroundContainerColour,
                    childWidget: GenderIcon(
                      genderText: 'MUJER',
                      genderIcon: FontAwesomeIcons.venus,
                      isActive: (selectedGender == Gender.female),
                    ),
                    onPressedWidget: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: kInactiveBackgroundContainerColour,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
                    style: kInactiveTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '${height.round()}',
                        style: kNumberStyle,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'cm',
                        style: kInactiveTextStyle,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbColor: kBottomColour,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kInactiveColor,
                        overlayColor: Color(0x26EA1556),
                      ),
                      child: Slider(
                        min: kMinHeight,
                        max: kMaxHeight,
                        divisions: (kMaxHeight - kMinHeight).toInt(),
                        value: height,
                        onChanged: (double value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveBackgroundContainerColour,
                    childWidget: WeightAge(
                      text: 'PESO',
                      variable: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveBackgroundContainerColour,
                    childWidget: WeightAge(
                      text: 'EDAD',
                      variable: age,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULAR TU IMC',
            onTap: () {
              CalculatorBMI yourBMI = CalculatorBMI(
                  height: height, weight: weight.weightAge.toDouble());
              Navigator.pushNamed(context, 'resultPage', arguments: yourBMI);
            },
          )
        ],
      ),
    );
  }
}
