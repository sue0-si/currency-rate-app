import 'package:flutter/cupertino.dart';

import '../data/repository/main_repository.dart';

class MainViewModel extends ChangeNotifier {
  final MainRepository _repository;

  MainViewModel({
    required MainRepository repository,
  }) : _repository = repository;

  // 기준 통화
  final String _baseCurrency = 'KRW';

  // 대상 통화
  final String _targetCurrency = 'USD';

  final double _baseAmount = 1000.0;

  // 대상 통화 금액
  double _targetAmount = 0.0;

  String get baseCurrency => _baseCurrency; // 기준 통화 금액
  String get targetCurrency => _targetCurrency;

  double get baseAmount => _baseAmount;

  double get targetAmount => _targetAmount;

  Future<void> exchangeCurrency(String baseCurrency) async {
    final result = await _repository.getCurrencyDto(baseCurrency);
    _targetAmount = _baseAmount * result.rates[_targetCurrency];
    notifyListeners();
  }
}
