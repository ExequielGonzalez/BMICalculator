import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class GenderIcon extends StatelessWidget {
  GenderIcon({this.genderText, this.genderIcon, @required this.isActive});

  final genderIcon;
  final genderText;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          genderIcon,
          color: isActive ? kActiveColor : kInactiveColor,
          size: 50,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          genderText,
          style: TextStyle(
            color: isActive ? kActiveColor : kInactiveColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
