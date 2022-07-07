import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_localization.dart';

/// Localization delegate that builds an [AppLocalization] instance
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  /// Returns a list of the supported locales that must match the
  /// list of _supportedLocales_ in [MaterialApp]
  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) =>
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
