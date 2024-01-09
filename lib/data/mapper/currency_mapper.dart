import '../dto/currency_dto.dart';
import '../model/currency_model.dart';

extension DtoToModel on CurrencyDto {
  CurrencyModel dtoToModel() {
    return CurrencyModel(
      lastUpdateTime: timeLastUpdateUnix ?? 0,
      nextUpdateTime: timeNextUpdateUnix ?? 0,
      baseCode: baseCode ?? '',
      rates: rates?.toJson() ?? {},
    );
  }
}
