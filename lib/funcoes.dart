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

TextStyle chartTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

BoxDecoration chartDecor =
    BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26)));
