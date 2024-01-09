import 'package:flutter/cupertino.dart';

import '../data/repository/main_repository.dart';

class MainViewModel extends ChangeNotifier {
  final MainRepository _repository;

  MainViewModel({
    required MainRepository repository,
  }) : _repository = repository;

  // 기준 통화
  String _baseCurrency = 'KRW';

  // 대상 통화
  String _targetCurrency = 'USD';

  double _baseAmount = 1000.0;

  // 대상 통화 금액
  double _targetAmount = 0.0;

  String get baseCurrency => _baseCurrency;

  set baseCurrency(String value) {
    _baseCurrency = value;
  }

  String get targetCurrency => _targetCurrency;

  set targetCurrency(String value) {
    _targetCurrency = value;
  }

  double get baseAmount => _baseAmount;

  set baseAmount(double value) {
    _baseAmount = value;
  }

  double get targetAmount => _targetAmount;

  set targetAmount(double value) {
    _targetAmount = value;
  }

  Future<void> exchangeCurrency(String baseCurrency) async {
    final result = await _repository.getCurrencyDto(baseCurrency);
    _targetAmount = _baseAmount * result.rates[_targetCurrency];
    notifyListeners();
  }


}
