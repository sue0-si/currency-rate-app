import 'package:currency_rate/data/mapper/currency_mapper.dart';
import 'package:currency_rate/data/model/currency_model.dart';
import 'package:currency_rate/data/repository/main_repository.dart';

import '../source/currency_source.dart';

class MainRepositoryImpl implements MainRepository {
  final _api = CurrencyApi();

  @override
  Future<CurrencyModel> getCurrencyModel(String baseCurrency) async {
    final dto = await _api.getCurrencyInfo(baseCurrency);
    return dto.dtoToModel();
  }
}
