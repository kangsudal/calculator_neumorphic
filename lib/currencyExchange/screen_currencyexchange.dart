import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../commonWidget/radioWidget.dart';

class CurrencyExchangeWidget extends StatelessWidget {
  const CurrencyExchangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double parentHeight = constraints.maxHeight * 0.6;
      double parentWidth = constraints.maxWidth;

      print("keypad maxHeight:${constraints.maxHeight}");
      print("keypad maxWidth:${constraints.maxWidth}");
      return Column(
        children: [
          Expanded(
            child: ModeChangeWidget(),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
              child: Column(
                children: [
                  TextField(),
                  TextField(),
                ],
              ),
            ),
            flex: 3,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: parentWidth * .75,
                  height: parentHeight,
                  color: Colors.pink,
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
                  color: Colors.blue,
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
            ),
            flex: 6,
          ),
        ],
      );
    });
  }
}
