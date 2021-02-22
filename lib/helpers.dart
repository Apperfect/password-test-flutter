import 'package:password_test/constants.dart';
import 'package:flutter/material.dart';

bool showSuccessIcon(int length) {
  if (length >= 7) {
    return true;
  } else {
    return false;
  }
}

String getMessage(int length) {
  if (length == 0) {
    return '';
  } else if (length > 0 && length < weakLimit) {
    return 'Weak Password';
  } else if (length >= weakLimit && length < mediumLimit) {
    return 'Medium Password';
  } else {
    return 'Strong Password';
  }
}

Color getActiveColor(int length) {
  if (length == 0) {
    return startingColor;
  } else if (length > 0 && length < weakLimit) {
    return weakColor;
  } else if (length >= weakLimit && length < mediumLimit) {
    return mediumColor;
  } else {
    return strongColor;
  }
}
