import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator with ChangeNotifier {
  String equation = '0';
  String result = '0';
  String expression = '';

  onKeyTap(String val) {
    if (equation == '0') {
      equation = val;
    } else {
      equation = equation + val;
    }

    notifyListeners();
  }

  onBackspacePress() {
    equation = equation.substring(0, equation.length - 1);
    if (equation == '') {
      equation = '0';
    }
    notifyListeners();
  }

  onClearPress() {
    equation = '0';
    result = '0';
    notifyListeners();
  }

  equal() {
    expression = equation;
    expression = expression.replaceAll("x", "*");
    expression = expression.replaceAll("÷", "/");
    expression = expression.replaceAll("%", "/100");

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = "$eval";
    } catch (e) {
      result = "Error";
    }

    notifyListeners();
  }
}
