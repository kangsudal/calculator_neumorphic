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
        baseColor: Color(0xFFE7EDEF),
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
              left: 15,
              right: 15,
              bottom: 15,
              top: 0,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ModeChangeWidget(),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
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
        depth: -10,
      ),
      child: Container(),
    );
  }
}

class InputButtons extends StatelessWidget {
  InputButtons({
    Key? key,
  }) : super(key: key);

  List<Widget> calculatorKeyPadData = [
    Text('C',style: TextStyle(color: Colors.white,),),
    Text('%',style: TextStyle(color: Colors.white,),),
    Icon(Icons.backspace,color: Colors.white,),
    Text("÷",style: TextStyle(color: Colors.white,),),
    Text('7'),
    Text('8'),
    Text('9'),
    Text('X',style: TextStyle(color: Colors.white,),),
    Text('4'),
    Text('5'),
    Text('6'),
    Text('-',style: TextStyle(color: Colors.white,),),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('+',style: TextStyle(color: Colors.white,),),
    Text('00'),
    Text('0'),
    Text('.'),
    Text('=',style: TextStyle(color: Colors.white,),),
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
            if (index == 0 || index == 1 || index == 2 || index == 3||index %4==3) {
              return NeumorphicButton(
                  style: NeumorphicStyle(color: Colors.black),
                  onPressed: () {},
                  child: Center(child: calculatorKeyPadData[index]));
            } else {
              return NeumorphicButton(
                  onPressed: () {},
                  child: Center(child: calculatorKeyPadData[index]));
            }
          },
        );
      },
    );
  }
}
