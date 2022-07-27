import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFF0F1F6),
        lightSource: LightSource.topLeft,
        depth: 5,
        intensity: 0.6,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 18,
              right: 18,
              bottom: 15,
              top: 0,
              child: Column(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModeChangeWidget extends StatefulWidget {
  const ModeChangeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ModeChangeWidget> createState() => _ModeChangeWidgetState();
}

class _ModeChangeWidgetState extends State<ModeChangeWidget> {
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NeumorphicRadio(
          groupValue: groupValue,
          value: 0,
          onChanged: (int? value) {
            setState(() {
              groupValue = value;
            });
          },
          padding: EdgeInsets.all(8.0),
          child: Text("Calculator"),
        ),
        SizedBox(
          width: 10,
        ),
        NeumorphicRadio(
          groupValue: groupValue,
          value: 1,
          onChanged: (int? value) {
            setState(() {
              groupValue = value;
            });
          },
          padding: EdgeInsets.all(8.0),
          child: Text("Currency"),
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
        child: Container(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 40,
              ),
            ), //todo: 커스텀 키보드 만들기
          ),
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
      value: "%",
    ),
    BackspaceButton(),
    OperatorButton(value: "÷"),
    NumberButton(
      value: 7,
    ),
    NumberButton(
      value: 8,
    ),
    NumberButton(
      value: 9,
    ),
    OperatorButton(
      value: 'X',
    ),
    NumberButton(value: 4),
    NumberButton(value: 5),
    NumberButton(value: 6),
    OperatorButton(
      value: '-',
    ),
    NumberButton(value: 1),
    NumberButton(value: 2),
    NumberButton(value: 3),
    OperatorButton(
      value: '+',
    ),
    HundredButton(),
    NumberButton(value: 0),
    OperatorButton(
      value: '.',
    ),
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

class NumberButton extends StatelessWidget {
  NumberButton({Key? key, required this.value}) : super(key: key);

  int value;
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () {}, child: Center(child: Text(value.toString())));
  }
}

class OperatorButton extends StatelessWidget {
  String value;

  OperatorButton({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(color: Colors.black),
        child: Center(
            child: Text(
          value,
          style: TextStyle(color: Colors.white),
        )));
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(color: Colors.black),
        child: Center(
            child: Text(
          "C",
          style: TextStyle(
            color: Colors.white,
          ),
        )));
  }
}

class BackspaceButton extends StatelessWidget {
  BackspaceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(color: Colors.black),
        child: Center(
            child: Icon(
          Icons.backspace,
          color: Colors.white,
        )));
  }
}

class EqualButton extends StatelessWidget {
  const EqualButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(color: Colors.black),
        child: Center(
            child: Text(
          "=",
          style: TextStyle(
            color: Colors.white,
          ),
        )));
  }
}

class HundredButton extends StatelessWidget {
  const HundredButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(color: Colors.black),
        child: Center(
            child: Text("00",
                style: TextStyle(
                  color: Colors.white,
                ))));
  }
}
