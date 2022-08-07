import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../commonWidget/radioWidget.dart';

class CurrencyExchangeWidget extends StatefulWidget {
  const CurrencyExchangeWidget({Key? key}) : super(key: key);

  @override
  State<CurrencyExchangeWidget> createState() => _CurrencyExchangeWidgetState();
}

class _CurrencyExchangeWidgetState extends State<CurrencyExchangeWidget> {
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
                    child: buildButton("7", Colors.white),
                  ),
                  Expanded(
                    child: buildButton("8", Colors.white),
                  ),
                  Expanded(
                    child: buildButton("9", Colors.white),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: buildButton("4", Colors.white),
                  ),
                  Expanded(
                    child: buildButton("5", Colors.white),
                  ),
                  Expanded(
                    child: buildButton("6", Colors.white),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: buildButton("1", Colors.white),
                  ),
                  Expanded(
                    child: buildButton("2", Colors.white),
                  ),
                  Expanded(
                    child: buildButton("3", Colors.white),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: buildButton("00", Colors.white),
                  ),
                  Expanded(
                    child: buildButton("0", Colors.white),
                  ),
                  Expanded(
                    child: buildButton(".", Colors.white),
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
                child: buildButton(Icons.backspace, Colors.black),
              ),
              Expanded(
                child: buildButton("C", Colors.black),
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
              child: buildInputPanel(),
            ),
            Expanded(
              child: buildResultPanel(),
            ),
          ],
        ),
      ),
    );
  }

  Container buildInputPanel() {
    String dropdownValue = 'Dollar AS USD';
    return Container(
      color: Colors.blueGrey,
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
                child: CircleAvatar(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                // color: Colors.blue,
                child: buildDropdownButton(dropdownValue),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                // color: Colors.red,
                child: Text("100"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildResultPanel() {
    String dropdownValue = 'Indonesia IDR';
    return Container(
      color: Colors.grey,
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
                child: CircleAvatar(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                // color: Colors.blue,
                child: buildDropdownButton(dropdownValue),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                // color: Colors.red,
                child: Text("100"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(dynamic buttonContent, Color buttonColor) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeumorphicButton(
          onPressed: () {},
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
          style: NeumorphicStyle(color: buttonColor),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline buildDropdownButton(String dropdownValue) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.black45),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Dollar AS USD', 'Indonesia IDR', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
