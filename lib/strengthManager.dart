import 'package:password_test/constants.dart';
import 'package:flutter/material.dart';

class StrengthAttributes {
  final bool result;
  final String resultString;
  final Color resultColor;

  const StrengthAttributes(this.result, this.resultString, this.resultColor);
}

StrengthAttributes validatePassword(int length) {
  final int weakLimit = 4;
  final int mediumLimit = 7;

  if (length == 0) {
    return (StrengthAttributes(false, '', startingColor));
  } else if (length > 0 && length < weakLimit) {
    return (StrengthAttributes(false, 'Weak Password', weakColor));
  } else if (length >= weakLimit && length < mediumLimit) {
    return (StrengthAttributes(false, 'Medium Password', mediumColor));
  } else {
    return (StrengthAttributes(true, 'Strong Password', strongColor));
  }
}
