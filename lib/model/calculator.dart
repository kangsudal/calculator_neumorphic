import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  List<String> firstNumList = [];
  List<String> secondNumList = [];
  int firstNum=0;
  int secondNum=0;

  String amount = '';

  onKeyTap(String val) {
    amount = amount + val;
    firstNumList.add(val);
    print(firstNumList);

    notifyListeners();
  }

  onBackspacePress() {
    amount = amount.substring(0, amount.length - 1);
    firstNumList.removeLast();
    print(firstNumList);
    notifyListeners();
  }

  onClearPress() {
    amount = '';
    firstNumList.clear();
    print(firstNumList);
    notifyListeners();
  }

  percent(){
    amount = amount + "%";
    firstNumList.add("%");
    // String temp = firstNumList.join();
    // firstNum = int.parse(temp);
    // print(firstNum.runtimeType);
    // onClearPress();
    notifyListeners();
  }

  divide(){
    amount = amount + "÷";
    firstNumList.add("/");
    // String temp = firstNumList.join();
    // firstNum = int.parse(temp);
    // print(firstNum.runtimeType);
    // onClearPress();
    notifyListeners();
  }

  mult(){
    amount = amount + "X";
    firstNumList.add("*");
    // String temp = firstNumList.join();
    // firstNum = int.parse(temp);
    // print(firstNum.runtimeType);
    // onClearPress();
    notifyListeners();
  }

  subtraction(){
    amount = amount + "-";
    firstNumList.add("-");
    // String temp = firstNumList.join();
    // firstNum = int.parse(temp);
    // print(firstNum.runtimeType);
    // onClearPress();
    notifyListeners();
  }

  add(){
    amount = amount + "+";
    firstNumList.add("+");
    // String temp = firstNumList.join();
    // firstNum = int.parse(temp);
    // print(firstNum.runtimeType);
    // onClearPress();
    notifyListeners();
  }

  equal(){
    amount = '결과값';
    firstNumList.add("=");
  }
  hundred(){
    amount = amount + "00";
    firstNumList.add("100");
  }
}
