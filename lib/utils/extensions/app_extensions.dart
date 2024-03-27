import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_starter/l10n/gen/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get L => AppLocalizations.of(this);
}

extension SizedBoxExtention on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
