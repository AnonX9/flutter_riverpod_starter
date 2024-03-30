import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String counterText(num counter) {
    String _temp0 = intl.Intl.pluralLogic(
      counter,
      locale: localeName,
      other: 'Vous avez appuyé sur le bouton ce nombre de fois :',
      zero: 'Vous n\'\'avez pas encore appuyé sur le bouton',
    );
    return '$_temp0';
  }

  @override
  String get addBtnTooltip => 'info-bulle';

  @override
  String get counterAppTitle => 'Compteur';
}
