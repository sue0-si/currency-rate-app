import '../dto/currency_dto.dart';

abstract interface class MainRepository {
 Future<CurrencyDto> getCurrencyDto(String baseCurrency);
}