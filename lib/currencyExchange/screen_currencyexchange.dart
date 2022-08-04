import 'package:flutter/material.dart';

import '../commonWidget/radioWidget.dart';

class CurrencyExchangeWidget extends StatelessWidget {
  const CurrencyExchangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            color: Colors.blue,
          ),
          flex: 6,
        ),
      ],
    );
  }
}
