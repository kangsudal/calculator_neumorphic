import 'package:calculator/model/calculator.dart';
import 'package:calculator/widget/keyboardButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import 'model/pageData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Calculator>(
          create: (context) => Calculator(),
        ),
        ChangeNotifierProvider<PageData>(
          create: (coontext) => PageData(),
        ),
      ],
      child: NeumorphicApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
          baseColor: Color(0xFFF0F1F6),
          lightSource: LightSource.topLeft,
          depth: 5,
          intensity: 0.6,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: IndexedStack(
                index: Provider.of<PageData>(context).pageIndex,
                children: [
                  PureCalculatorWidget(),
                  Container(
                    color: Colors.blueAccent,
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
              Provider.of<PageData>(context,listen: false).setPageIndex(value!);
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
              Provider.of<PageData>(context,listen: false).setPageIndex(value!);
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  Provider.of<Calculator>(context).equation,
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
                  Provider.of<Calculator>(context).result,
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
