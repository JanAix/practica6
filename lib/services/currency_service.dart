import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  static String getConversionUrl(String amount, String base, String target, String? date) {
    return date == null
        ? 'https://api.frankfurter.app/latest?amount=$amount&from=$base&to=$target'
        : 'https://api.frankfurter.app/$date?amount=$amount&from=$base&to=$target';
  }

  static Future<double?> fetchConversion(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['rates'].values.first.toDouble();
    }
    return null;
  }
}
