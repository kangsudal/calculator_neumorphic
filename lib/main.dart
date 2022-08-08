import 'package:calculator/model/calculator.dart';
import 'package:calculator/model/currencyexchange.dart';
import 'package:calculator/pureCalculator/screen_purecalculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import 'currencyExchange/screen_currencyexchange.dart';
import 'model/pageData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This pureCalculator is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Calculator>(
          create: (context) => Calculator(),
        ),
        ChangeNotifierProvider<PageData>(
          create: (context) => PageData(),
        ),
        ChangeNotifierProvider<CurrencyExchange>(
          create: (context) => CurrencyExchange(),
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
                  CurrencyExchangeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
