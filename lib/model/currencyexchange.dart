import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CurrencyExchange with ChangeNotifier {
  String inputString = '0';
  String resultString = '0';

  String inputCurrency = 'Dollar AS USD';
  String resultCurrency = 'Indonesia IDR';

  void buttonPressed(dynamic buttonContent) {
    if (buttonContent == "C") {
      inputString = '0';
      resultString = '0';
    } else if (buttonContent == IconData) {
      inputString = inputString.substring(0, inputString.length - 1);
      if (inputString == '') {
        inputString = '0';
      }
    } else {
      if (inputString == '0') {
        inputString = buttonContent;
      } else {
        inputString = inputString + buttonContent;
      }
    }
    try {
      Parser p = new Parser();
      Expression exp = p.parse(inputString);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      double tempResult = exchange(eval, inputCurrency, resultCurrency);
      resultString = '$tempResult';
    } catch (e) {
      resultString = 'Error';
    }
    notifyListeners();
  }

  double exchange(double eval, String inputCurrency, String resultCurrency) {
    //환전로직

    return eval*1304.79;
  }
}
