import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightAge extends StatefulWidget {
  WeightAge({Key key, @required this.variable, @required this.text})
      : super(key: key);

  final BodyWeightAge variable;
  final String text;

  _WeightAgeState createState() => _WeightAgeState();
}

class _WeightAgeState extends State<WeightAge> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: kInactiveTextStyle,
        ),
        Text(
          widget.variable.weightAge.round().toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onTap: () {
                setState(() {
                  if (widget.variable.weightAge > 0)
                    widget.variable.weightAge--;
                });
              },
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onTap: () {
                setState(() {
                  widget.variable.weightAge += 1;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onTap});

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      shape: CircleBorder(),
      fillColor: kActiveBackgroundContainerColour,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}

class BodyWeightAge {
  BodyWeightAge(this.weightAge);
  int weightAge;
}
