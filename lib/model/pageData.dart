import 'package:flutter/cupertino.dart';

class PageData with ChangeNotifier{
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}