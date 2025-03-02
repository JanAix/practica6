import 'package:flutter/material.dart';
import 'screens/currency_converter_screen.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Monedas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CurrencyConverterScreen(),
    );
  }
}
