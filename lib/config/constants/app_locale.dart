import 'package:flutter/material.dart';

class AppLocale {
  static const Locale fallbackLocale = LocaleNames.englishLocale;

  static const List<Locale> supportedLocales = [
    LocaleNames.turkishLocale,
    LocaleNames.englishLocale
  ];
}

class LocaleNames {
  static const Locale turkishLocale = Locale('tr', 'TR');
  static const Locale englishLocale = Locale('en', 'US');
}
