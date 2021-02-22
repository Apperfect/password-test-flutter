import 'package:flutter/material.dart';

InputDecoration textFieldDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
);

Color startingColor = Colors.transparent;
Color strongColor = Colors.green;
Color mediumColor = Colors.amber;
Color weakColor = Colors.red;

int weakLimit = 4;
int mediumLimit = 7;
