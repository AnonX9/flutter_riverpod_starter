import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String counterText(num counter) {
    String _temp0 = intl.Intl.pluralLogic(
      counter,
      locale: localeName,
      other: 'You have pushed the button this many times',
      zero: 'You haven\'\'t pushed the button yet',
    );
    return '$_temp0';
  }

  @override
  String get addBtnTooltip => 'tooltip';

  @override
  String get counterAppTitle => 'Counter';
}
