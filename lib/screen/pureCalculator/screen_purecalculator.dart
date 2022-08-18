import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import 'package:calculator/screen/commonWidget/radioWidget.dart';
import 'package:calculator/model/calculator.dart';
import 'keyboardButtons.dart';

class PureCalculatorWidget extends StatelessWidget {
  const PureCalculatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ModeChangeWidget(),
          flex: 1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ShowCalculatingWidget(),
          ),
          flex: 3,
        ),
        Expanded(
          child: InputButtons(),
          flex: 6,
        ),
      ],
    );
  }
}

class ShowCalculatingWidget extends StatelessWidget {
  const ShowCalculatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -20,
      ),
      child: SizedBox.expand(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  Provider.of<PureCalculator>(context).equation,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ), //todo: 커스텀 키보드 만들기
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  Provider.of<PureCalculator>(context).result,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                  overflow: TextOverflow.ellipsis,
                ), //todo: 커스텀 키보드 만들기
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputButtons extends StatelessWidget {
  InputButtons({
    Key? key,
  }) : super(key: key);

  List<Widget> calculatorKeyPadData = [
    ClearButton(),
    OperatorButton(
      label: "%",
    ),
    BackspaceButton(),
    OperatorButton(label: "÷"),
    NumberButton(
      value: '7',
    ),
    NumberButton(
      value: '8',
    ),
    NumberButton(
      value: '9',
    ),
    OperatorButton(
      label: 'x',
    ),
    NumberButton(value: '4'),
    NumberButton(value: '5'),
    NumberButton(value: '6'),
    OperatorButton(
      label: '-',
    ),
    NumberButton(value: '1'),
    NumberButton(value: '2'),
    NumberButton(value: '3'),
    OperatorButton(
      label: '+',
    ),
    NumberButton(value: '00'),
    NumberButton(value: '0'),
    NumberButton(value: '.'),
    EqualButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double keyPadHeight = constraints.maxHeight;
        double keyPadWidth = constraints.maxWidth;
        return GridView.builder(
          itemCount: calculatorKeyPadData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10, //수평 패딩
            mainAxisSpacing: 10, //수직 패딩
            mainAxisExtent: (keyPadHeight / 5) - 10, //한 셀당 세로길이
          ),
          itemBuilder: (BuildContext context, int index) {
            return calculatorKeyPadData[index];
          },
        );
      },
    );
  }
}
