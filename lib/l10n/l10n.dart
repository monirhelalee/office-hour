import 'package:flutter/widgets.dart';
import 'package:office_hour/l10n/gen/app_localizations.dart';

export 'package:office_hour/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
