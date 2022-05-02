import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/l10n/l10n.dart';

class LanguageProvider with ChangeNotifier {
  Locale? _locale = Locale('en');

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}