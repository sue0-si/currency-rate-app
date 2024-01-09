import 'dart:convert';

import 'package:currency_rate/data/dto/currency_dto.dart';
import 'package:currency_rate/data/mapper/currency_mapper.dart';

import '../source/currency_source.dart';
import 'main_repository.dart';

class MainRepositoryImpl implements MainRepository{
  final _api = CurrencyApi();

  @override
  Future<CurrencyDto> getCurrencyDto(String baseCurrency) async{
    final dto = await _api.getCurrencyInfo(baseCurrency);
    return dto.rates.map((key, value) => );

  }
}