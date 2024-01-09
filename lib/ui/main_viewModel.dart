import 'package:flutter/cupertino.dart';

import '../data/repository/main_repository.dart';

class MainViewModel extends ChangeNotifier {
  final MainRepository _repository;

  MainViewModel({
    required MainRepository repository,
  }) : _repository = repository;

  // 기준 통화
  String baseCurrency = 'KRW';

  // 대상 통화
  String targetCurrency = 'USD';

  String baseAmount = '';

  // 대상 통화 금액
  String targetAmount = '';

  num _inputAmount = 0.0;
  num _convertedAmount = 0.0;
  String _resultText = '';

  get inputAmount => _inputAmount;

  set inputAmount(value) {
    _inputAmount = value;
  }

  get convertedAmount => _convertedAmount;

  set convertedAmount(value) {
    _convertedAmount = value;
  }

  get resultText => _resultText;

  set resultText(value) {
    _resultText = value;
  }

  Future<void> exchangeCurrency(bool forTargetTextField, String baseAmount,
      String targetAmount, String baseCurrency, String targetCurrency) async {
    final result = await _repository.getCurrencyDto(baseCurrency);

    _inputAmount = (forTargetTextField
            ? num.tryParse(baseAmount)
            : num.tryParse(targetAmount)) ??
        0.0;
    _convertedAmount = forTargetTextField
        ? _inputAmount *
            result.rates[targetCurrency] /
            result.rates[baseCurrency]
        : _inputAmount /
            result.rates[targetCurrency] *
            result.rates[baseCurrency];

    _resultText = _convertedAmount.toStringAsFixed(2);
    // if (isFromTextField) {
    //   targetAmount = _resultText;
    // } else {
    //   baseAmount = _resultText;
    // }

    notifyListeners();
  }
}
