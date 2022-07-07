import 'package:flutter/material.dart';

/// Adds an useful localization method on a [BuildContext]
extension LocalizationExt on BuildContext {
  String localize(String value) {
    final code = AppLocalization.of(this).locale.languageCode;
    final database = AppLocalization._localizedValues;

    if (database.containsKey(code)) {
      return database[code]?[value] ?? "-";
    } else {
      return database["en"]?[value] ?? "-";
    }
  }
}

/// This class is responsible of translating strings into a certain
/// languages defined by the [Locale] passed in the constructor.
class AppLocalization {
  final Locale locale;

  const AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "title": "BMI Calculator",
      "label_calculate": "CALCULATE",
      "label_recalculate": "RE-CALCULATE",
      "label_male": "MALE",
      "label_female": "FEMALE",
      "label_weight": "WEIGHT",
      "label_height": "HEIGHT",
      "label_age": "AGE",
      "label_result": "Your Result",
    },
    "vi": {
      "title": "Máy tính BMI",
      "label_calculate": "TÍNH",
      "label_recalculate": "TÍNH LẠI",
      "label_male": "NAM",
      "label_female": "NỮ",
      "label_weight": "CÂN NẶNG",
      "label_height": "CHIỀU CAO",
      "label_age": "TUỔI",
      "label_result": "KẾT QUẢ",
    },
  };
}
