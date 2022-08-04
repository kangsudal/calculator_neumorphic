import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  String equation = '0';
  String result = '0';
  // String expression = '';

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
    notifyListeners();
  }
}
