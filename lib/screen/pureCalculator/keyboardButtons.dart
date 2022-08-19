import 'package:calculator/provider/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class NumberButton extends StatelessWidget {
  NumberButton({Key? key, required this.value}) : super(key: key);

  String value;
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Provider.of<PureCalculator>(context, listen: false).onKeyTap(value);
      },
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Orbitron',
          ),
        ),
      ),
    );
  }
}

class OperatorButton extends StatelessWidget {
  String label;

  OperatorButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Provider.of<PureCalculator>(context, listen: false).onKeyTap(label);
      },
      style: NeumorphicStyle(color: Colors.black),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Orbitron',
          ),
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Provider.of<PureCalculator>(context, listen: false).onClearPress();
      },
      style: NeumorphicStyle(color: Colors.black),
      child: Center(
        child: Text(
          "C",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Orbitron',
          ),
        ),
      ),
    );
  }
}

class BackspaceButton extends StatelessWidget {
  BackspaceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Provider.of<PureCalculator>(context, listen: false).onBackspacePress();
      },
      style: NeumorphicStyle(color: Colors.black),
      child: Center(
        child: Icon(
          Icons.backspace,
          color: Colors.white,
        ),
      ),
    );
  }
}

class EqualButton extends StatelessWidget {
  const EqualButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Provider.of<PureCalculator>(context, listen: false).equal();
      },
      style: NeumorphicStyle(color: Colors.black),
      child: Center(
        child: Text(
          "=",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Orbitron',
          ),
        ),
      ),
    );
  }
}
