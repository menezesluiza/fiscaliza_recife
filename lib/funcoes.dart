import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

isZero(var value) {
  if (value == 0 || value == null) {
    return true;
  } else
    return false;
}

String getCurrency(value) {
  NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
  return formatter.format(value);
}

num percentual(num num1, num num2) => ((num2 - num1) / num1) * 100;

TextStyle chartTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

TextStyle percentText = TextStyle(fontSize: 14);

BoxDecoration chartDecor = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: Colors.black26),
  ),
);
