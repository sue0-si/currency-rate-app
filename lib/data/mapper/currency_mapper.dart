import 'package:currency_rate/data/dto/currency_dto.dart';
import 'package:currency_rate/data/model/currency_model.dart';

Map<String, dynamic> myMap = {};

extension currencyToDTO on CurrencyDto {

  CurrencyModel toCurrencyModel() {
    return CurrencyModel(lastUpdateTime: timeLastUpdateUnix ?? 0,
        nextUpdateTime: timeNextUpdateUnix ?? 0,
        baseCode: baseCode ?? 'KRW',
        rates: rates ?? );

  }
}