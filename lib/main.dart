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
        SizedBox(width: 10,),
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
      style: NeumorphicStyle(depth: -10,),
      child: Container(),
    );
  }
}

class InputButtons extends StatelessWidget {
  const InputButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
