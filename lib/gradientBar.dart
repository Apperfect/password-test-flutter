import 'package:flutter/material.dart';

class GradientBar extends StatelessWidget {
  const GradientBar({
    Key key,
    @required this.activeColor,
  }) : super(key: key);

  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, activeColor],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.only(bottom: 10, top: 10),
      height: 5,
    );
  }
}
