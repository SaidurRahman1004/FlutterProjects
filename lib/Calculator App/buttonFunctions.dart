import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttonFunctions.dart';

class CalcButton {
  final String label;
  final String type; // number, operator, action
  CalcButton(this.label, this.type);
}

// Best Organized Button List
final List<CalcButton> calculatorButtons = [
  // Row 1
  CalcButton("AC", "action"),
  CalcButton("()", "action"),
  CalcButton("%", "operator"),
  CalcButton("÷", "operator"),

  // Row 2
  CalcButton("7", "number"),
  CalcButton("8", "number"),
  CalcButton("9", "number"),
  CalcButton("x", "operator"),

  // Row 3
  CalcButton("4", "number"),
  CalcButton("5", "number"),
  CalcButton("6", "number"),
  CalcButton("-", "operator"),

  // Row 4
  CalcButton("1", "number"),
  CalcButton("2", "number"),
  CalcButton("3", "number"),
  CalcButton("+", "operator"),

  // Row 5
  CalcButton("0", "number"),
  CalcButton(".", "number"),
  CalcButton("⌫", "action"), // backspace
  CalcButton("=", "action"),
];

