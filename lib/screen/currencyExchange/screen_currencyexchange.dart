import 'package:calculator/provider/currencyexchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:country_icons/country_icons.dart';
import 'package:calculator/screen/commonWidget/radioWidget.dart';

class CurrencyExchangeWidget extends StatefulWidget {
  const CurrencyExchangeWidget({Key? key}) : super(key: key);

  @override
  State<CurrencyExchangeWidget> createState() => _CurrencyExchangeWidgetState();
}

class _CurrencyExchangeWidgetState extends State<CurrencyExchangeWidget> {
  AssetImage _img =
      AssetImage('icons/flags/png/us.png', package: 'country_icons');
  String _strCurrency='USD';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double parentHeight = constraints.maxHeight * 0.6;
      double parentWidth = constraints.maxWidth;

      // print("keypad maxHeight:${constraints.maxHeight}");
      // print("keypad maxWidth:${constraints.maxWidth}");
      return Column(
        children: [
          Expanded(
            child: ModeChangeWidget(),
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: buildShowPanel(),
            ),
          ),
          Expanded(
            flex: 6,
            child: buildInputButtons(parentWidth, parentHeight),
          ),
        ],
      );
    });
  }

  Row buildInputButtons(double parentWidth, double parentHeight) {
    return Row(
      children: [
        Container(
          width: parentWidth * .75,
          height: parentHeight,
          // color: Colors.pink,
          child: Column(
            children: [
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: buildButton("7", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton("8", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton("9", Colors.white, context),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: buildButton("4", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton("5", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton("6", Colors.white, context),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: buildButton("1", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton("2", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton("3", Colors.white, context),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: buildButton("00", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton("0", Colors.white, context),
                  ),
                  Expanded(
                    child: buildButton(".", Colors.white, context),
                  ),
                ]),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
        Container(
          width: parentWidth * 0.25,
          height: parentHeight,
          // color: Colors.blue,
          child: Column(
            children: [
              Expanded(
                child: buildButton(Icons.backspace, Colors.black, context),
              ),
              Expanded(
                child: buildButton("C", Colors.black, context),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Neumorphic buildShowPanel() {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -20,
      ),
      child: Container(
        // color: Colors.purple,
        child: Column(
          children: [
            Expanded(
              child: buildInputPanel(context),
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    Provider.of<CurrencyExchange>(context, listen: false)
                        .exchangeButtonPressed();
                  },
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
            ), //환전버튼
            Expanded(
              child: buildResultPanel(context),
            ),
          ],
        ),
      ),
    );
  }

  Container buildResultPanel(BuildContext context) {
    String resultString = Provider.of<CurrencyExchange>(context).resultString;
    return Container(
      // color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(right: 5),
                // color: Colors.white,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      shape: NeumorphicShape.convex),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('icons/flags/png/kr.png',
                        package: 'country_icons'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
              child: Align(alignment: Alignment.center, child: Text('KRW')),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
              child:
                  Align(alignment: Alignment.center, child: Text(resultString)),
            ),
          ),
        ],
      ),
    );
  }

  Container buildInputPanel(BuildContext context) {
    String inputString = Provider.of<CurrencyExchange>(context).inputString;
    return Container(
      // color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(right: 5),
                // color: Colors.white,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      shape: NeumorphicShape.convex),
                  child: CircleAvatar(
                    backgroundImage: _img,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.blue,
              child: TextButton(
                style: ButtonStyle(
                  // alignment: Alignment.center,
                  // backgroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  showCurrencyPicker(
                    context: context,
                    showFlag: true,
                    showCurrencyName: true,
                    showCurrencyCode: true,
                    onSelect: (Currency currency) {
                      print('Select currency: ${currency.code}');
                      changeIconAndCurrency(currency.code);
                    },
                    currencyFilter: <String>[
                      // 'EUR', TODO: EUR 국기 처리
                      'GBP',
                      'USD',
                      'AUD',
                      'CAD',
                      // 'JPY', TODO: 한국수출입은행 JPY(100)에 맞게 처리
                      'HKD',
                      'CHF',
                      'SEK',
                    ],
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$_strCurrency',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                // color: Colors.red,
                child: Text(inputString),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
      dynamic buttonContent, Color buttonColor, BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeumorphicButton(
          onPressed: () {
            //inputValue값이 바뀐다
            Provider.of<CurrencyExchange>(context, listen: false)
                .buttonPressed(buttonContent);
            //inputValue에 따라 resultValue값도 바뀐다.
          },
          child: buttonContent.runtimeType == IconData
              ? Center(
                  child: Icon(
                  buttonContent,
                  color: Colors.white,
                ))
              : Center(
                  child: Text(
                    buttonContent,
                    style: TextStyle(
                      fontSize: buttonContent == "00" ? 22 : 25,
                      fontWeight: FontWeight.normal,
                      color: buttonColor == Colors.black
                          ? Colors.white
                          : Colors.black,
                      fontFamily: 'Orbitron',
                    ),
                  ),
                ),
          style: buttonColor == Colors.black
              ? NeumorphicStyle(color: buttonColor)
              : NeumorphicStyle(),
        ),
      ),
    );
  }

  void changeIconAndCurrency(String code) {
    switch (code) {
      case 'USD':
        setState(() {
          _img = AssetImage('icons/flags/png/us.png', package: 'country_icons');
        });
        break;
      case 'GBP':
        setState(() {
          _img = AssetImage('icons/flags/png/gb.png', package: 'country_icons');
        });
        break;
      case 'AUD':
        setState(() {
          _img = AssetImage('icons/flags/png/au.png', package: 'country_icons');
        });
        break;
      case 'CAD':
        setState(() {
          _img = AssetImage('icons/flags/png/ca.png', package: 'country_icons');
        });
        break;
      case 'CHF':
        setState(() {
          _img = AssetImage('icons/flags/png/ch.png', package: 'country_icons');
        });
        break;
      case 'HKD':
        setState(() {
          _img = AssetImage('icons/flags/png/hk.png', package: 'country_icons');
        });
        break;
      case 'SEK':
        setState(() {
          _img = AssetImage('icons/flags/png/se.png', package: 'country_icons');
        });
        break;
      default:
        _img = AssetImage('icons/flags/png/us.png', package: 'country_icons');
    }
    //환전 통화를 바꿈
    Provider.of<CurrencyExchange>(context, listen: false)
        .changeResultCurrency(code);

    setState((){
      _strCurrency = code;
    });
  }
}
