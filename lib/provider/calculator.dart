import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class PureCalculator with ChangeNotifier {
  String equation = '0'; //사용자 화면에 표시할 값 <-입력식
  String result = '0';   //사용자 화면에 표시할 값 <-계산결과값
  String expression = ''; //내부적으로 정말 계산할 수식으로 변환 <- equation

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
      //String 수식 -> math_expressions라이브러리-> double 계산 결과값
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
