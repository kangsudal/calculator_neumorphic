import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NumberButton extends StatelessWidget {
  NumberButton({Key? key, required this.value}) : super(key: key);

  int value;
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {},
      child: Center(
        child: Text(
          value.toString(),
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
      onPressed: () {},
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
      onPressed: () {},
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
      onPressed: () {},
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
      onPressed: () {},
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

class HundredButton extends StatelessWidget {
  const HundredButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {},
      child: Center(
        child: Text(
          "00",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Orbitron',
          ),
        ),
      ),
    );
  }
}

class DecimalPointButton extends StatelessWidget {
  const DecimalPointButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {},
      child: Center(
        child: Text(
          ".",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Orbitron',
          ),
        ),
      ),
    );
  }
}