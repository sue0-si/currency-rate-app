import '../model/currency_model.dart';

abstract interface class MainRepository {
 Future<CurrencyModel> getCurrencyModel(String baseCurrency);
}