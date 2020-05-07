import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.childWidget, this.onPressedWidget});

  final Color colour;
  final Widget childWidget;
  final Function onPressedWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedWidget,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: childWidget,
      ),
    );
  }
}
