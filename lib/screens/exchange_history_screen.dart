import 'package:flutter/material.dart';

class ExchangeHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial de Tasas de Cambio')),
      body: Center(child: Text('Aquí se mostrarán las tasas recientes.')), // Se puede mejorar con una API call
    );
  }
}
