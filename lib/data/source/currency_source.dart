import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/currency_dto.dart';

class CurrencyApi {
  Future<CurrencyDto> getCurrencyInfo(String baseCurrency) async {
    final response = await http.get(Uri.parse('https://open.er-api.com/v6/latest/$baseCurrency'));
    return CurrencyDto.fromJson(jsonDecode(response.body));
  }
}