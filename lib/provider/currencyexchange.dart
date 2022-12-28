import 'dart:convert';

import 'package:calculator/model/currencyObj.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as de;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:math_expressions/math_expressions.dart';

class CurrencyExchange with ChangeNotifier {
  String inputString = '0';
  String resultString = '0';

  // String inputCurrency = 'Dollar AS USD';
  String resultCurrency = 'CHF'; //'SEK';//'USD';
  /*                    'GBP',
                        'USD',
                        'AUD',
                        'CAD',
                        'HKD',
                        'CHF',
                        'SEK',*/

  void buttonPressed(dynamic buttonContent) async {
    if (buttonContent == "C") {
      inputString = '0';
      resultString = '0';
    } else if (buttonContent.runtimeType == IconData) {
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
    notifyListeners();
  }

  Future<void> exchangeButtonPressed() async {
    //화살표 버튼을 눌렀을때 환전 값을 불러오는 메서드
    //키패드로 숫자를 입력할때마다 콜을 너무 많이 불러오는거같아서 버튼을 넣었음
    try {
      Parser p = new Parser();
      Expression exp = p.parse(inputString);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      double tempResult = await exchange(eval, resultCurrency);
      resultString = '$tempResult';
    } catch (e) {
      resultString = 'Error';
    }
    notifyListeners();
  }

  Future<double> exchange(double eval, String resultCurrency) async {
    double tts = 0; //전신환(송금)보내실때 환율
    //환전로직
    List<CurrencyObj> currencyObjs = await getCurrencies(); //모든 통화코드의 객체를 가져온다
    var currentObj = currencyObjs.firstWhere((obj) {
      return obj.cur_unit == resultCurrency; //결과 값으로 보여줄 통화코드와 일치하는 객체(데이터) 리턴
    });
    print(currentObj);
    // double tts = double.parse(currentObj.tts);
    String tts_str = currentObj.tts.replaceAll(',', ''); //'1,350'->'1350'
    tts = double.parse(tts_str);
    print(tts.runtimeType);
    return eval * tts;
  }

  Future<List<CurrencyObj>> getCurrencies() async {
    //한국수출입은행이 제공하는 환율정보를 가져오는 메소드. 받아온 JSON데이터를 CurrencyObj 객체에 담는다
    List<CurrencyObj> currencyObjs = [];
    String? APIKEY = de.dotenv.env['APIKEY'];
    Uri url = Uri.parse(
        'https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=$APIKEY&searchdate=&data=AP01');
    Response response = await http.get(url);
    //todo: 비영업일의 데이터, 혹은 영업당일 11시 이전에 해당일의 데이터를 요청할 경우 null 값이 반환되는것 처리

    if (response.statusCode == 200) {
      print('the server returned a 200 response');
      String jsonString = response.body;
      // print(jsonString);
      List<dynamic> dataList = json.decode(jsonString);
      currencyObjs =
          dataList.map((json) => CurrencyObj.fromJson(json)).toList();
    }
    return currencyObjs; //객체리스트 반환
  }

  void changeResultCurrency(String code) {
    //환전결과 통화 코드 바꾸는 메소드
    resultCurrency = code;
    notifyListeners();
  }
}
