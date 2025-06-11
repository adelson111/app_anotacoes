import 'package:app_anotacoes/l10n/gen_l10n/app_localizations.dart';
import 'package:app_anotacoes/util/preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LocalizationCodeConfig { system, en, es, pt }

class LocalizationConfig extends ChangeNotifier {
  LocalizationCodeConfig _localization = LocalizationCodeConfig.system;

  void setLocalization(LocalizationCodeConfig code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PreferencesKeys.localizationCode, code.name);
    _localization = code;
    notifyListeners();
  }

  Future<void> getLocalization() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? code = prefs.getString(PreferencesKeys.localizationCode);

    _localization = LocalizationCodeConfig.values.firstWhere(
      (value) => value.name == code,
      orElse: () => LocalizationCodeConfig.system,
    );
  }

  LocalizationCodeConfig getLocalizationCode() {
    return _localization;
  }

  Locale? getLocale() {
    return isSystemDefault() ? null : Locale(_localization.name);
  }

  bool isSystemDefault() {
    return _localization == LocalizationCodeConfig.system;
  }
}

AppLocalizations generateLanguage(BuildContext context) {
  return AppLocalizations.of(context)!;
}
