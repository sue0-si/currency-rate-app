

class CurrencyModel {
   int lastUpdateTime;
   int nextUpdateTime;
   String baseCode;
   Map<String, dynamic> rates;

//<editor-fold desc="Data Methods">
  CurrencyModel({
    required this.lastUpdateTime,
    required this.nextUpdateTime,
    required this.baseCode,
    required this.rates,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyModel &&
          runtimeType == other.runtimeType &&
          lastUpdateTime == other.lastUpdateTime &&
          nextUpdateTime == other.nextUpdateTime &&
          baseCode == other.baseCode &&
          rates == other.rates);

  @override
  int get hashCode =>
      lastUpdateTime.hashCode ^
      nextUpdateTime.hashCode ^
      baseCode.hashCode ^
      rates.hashCode;

  @override
  String toString() {
    return 'CurrencyModel{' +
        ' lastUpdateTime: $lastUpdateTime,' +
        ' nextUpdateTime: $nextUpdateTime,' +
        ' baseCode: $baseCode,' +
        ' rates: $rates,' +
        '}';
  }

  CurrencyModel copyWith({
    int? lastUpdateTime,
    int? nextUpdateTime,
    String? baseCode,
    Map<String, dynamic>? rates,
  }) {
    return CurrencyModel(
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
      nextUpdateTime: nextUpdateTime ?? this.nextUpdateTime,
      baseCode: baseCode ?? this.baseCode,
      rates: rates ?? this.rates,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lastUpdateTime': this.lastUpdateTime,
      'nextUpdateTime': this.nextUpdateTime,
      'baseCode': this.baseCode,
      'rates': this.rates,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      lastUpdateTime: map['lastUpdateTime'] as int,
      nextUpdateTime: map['nextUpdateTime'] as int,
      baseCode: map['baseCode'] as String,
      rates: map['rates'] as Map<String, dynamic>,
    );
  }

//</editor-fold>
}