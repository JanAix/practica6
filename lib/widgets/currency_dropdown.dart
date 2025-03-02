import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;

  CurrencyDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: ['USD', 'EUR', 'GBP'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
