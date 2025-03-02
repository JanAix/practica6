import 'package:flutter/material.dart';

class CurrencyInputField extends StatelessWidget {
  final TextEditingController controller;

  CurrencyInputField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Cantidad'),
    );
  }
}
