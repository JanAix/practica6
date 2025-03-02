import 'package:flutter/material.dart';
import '../services/currency_service.dart';
import '../services/date_selector.dart';
import '../widgets/currency_dropdown.dart';
import '../widgets/currency_input_field.dart';
import 'exchange_history_screen.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _baseCurrency = 'USD';
  String _targetCurrency = 'EUR';
  String _convertedAmount = '';
  String? _selectedDate;

  Future<void> _convertCurrency() async {
    String url = CurrencyService.getConversionUrl(
        _amountController.text, _baseCurrency, _targetCurrency, _selectedDate);
    final result = await CurrencyService.fetchConversion(url);
    if (result != null) {
      setState(() {
        _convertedAmount = result.toString();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    String? date = await DateSelector.selectDate(context);
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor de Monedas')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CurrencyInputField(controller: _amountController),
            CurrencyDropdown(
              value: _baseCurrency,
              onChanged: (newValue) {
                setState(() {
                  _baseCurrency = newValue!;
                });
              },
            ),
            CurrencyDropdown(
              value: _targetCurrency,
              onChanged: (newValue) {
                setState(() {
                  _targetCurrency = newValue!;
                });
              },
            ),
            TextButton(
              onPressed: () => _selectDate(context),
              child: Text(_selectedDate == null ? 'Seleccionar Fecha' : _selectedDate!),
            ),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Convertir'),
            ),
            Text(
              _convertedAmount.isNotEmpty ? 'Resultado: $_convertedAmount $_targetCurrency' : '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExchangeHistoryScreen()),
                );
              },
              child: Text('Ver Historial'),
            ),
          ],
        ),
      ),
    );
  }
}
