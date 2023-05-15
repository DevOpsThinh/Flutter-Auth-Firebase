import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:auth_app/localization/app_localization.dart';

/// Localization delegate that builds an [AppLocalization] by passing to it the
/// locale of the system.
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  /// Returns a list of the supported locales that should (well, actually it
  /// **must**) match the list of _supportedLocales_ in [FomentApp]
  @override
  bool isSupported(Locale locale) =>
      ['en', 'vn'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) =>
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}