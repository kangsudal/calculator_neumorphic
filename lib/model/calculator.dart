import 'package:flutter/material.dart';

class FiveCal with ChangeNotifier{
  String amount = '';

  onKeyTap(val){
    amount = amount + val;
    notifyListeners();
  }

  onBackspacePress(val){
    amount = amount.substring(0,amount.length-1);
    notifyListeners();
  }

  onClearPress(){
    amount = '';
    notifyListeners();
  }
}