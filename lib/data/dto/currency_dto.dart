class CurrencyDto {
  String? result;
  String? provider;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  int? timeEolUnix;
  String? baseCode;
  Rates? rates;

  CurrencyDto(
      {this.result,
        this.provider,
        this.documentation,
        this.termsOfUse,
        this.timeLastUpdateUnix,
        this.timeLastUpdateUtc,
        this.timeNextUpdateUnix,
        this.timeNextUpdateUtc,
        this.timeEolUnix,
        this.baseCode,
        this.rates});

  CurrencyDto.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    provider = json['provider'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    timeEolUnix = json['time_eol_unix'];
    baseCode = json['base_code'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['provider'] = provider;
    data['documentation'] = documentation;
    data['terms_of_use'] = termsOfUse;
    data['time_last_update_unix'] = timeLastUpdateUnix;
    data['time_last_update_utc'] = timeLastUpdateUtc;
    data['time_next_update_unix'] = timeNextUpdateUnix;
    data['time_next_update_utc'] = timeNextUpdateUtc;
    data['time_eol_unix'] = timeEolUnix;
    data['base_code'] = baseCode;
    if (rates != null) {
      data['rates'] = rates!.toJson();
    }
    return data;
  }
}

