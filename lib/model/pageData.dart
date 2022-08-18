import 'package:flutter/cupertino.dart';

class PageData with ChangeNotifier{
  //radio버튼에 의해 페이지가 변화되도록 groupValue값을 관리
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}