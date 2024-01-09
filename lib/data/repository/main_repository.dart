import '../model/currency_model.dart';

abstract interface class MainRepository {
  Future<CurrencyModel> getCurrencyDto(String baseCurrency);
}
