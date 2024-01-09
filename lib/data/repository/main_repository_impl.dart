import 'package:currency_rate/data/mapper/currency_mapper.dart';

import '../model/currency_model.dart';
import '../source/currency_source.dart';
import 'main_repository.dart';

class MainRepositoryImpl implements MainRepository{
  final _api = CurrencyApi();

  @override
  Future<CurrencyModel> getCurrencyDto(String baseCurrency) async{
    final dto = await _api.getCurrencyInfo(baseCurrency);
    return dto.toCurrencyModel();

  }
}