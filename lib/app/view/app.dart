import 'package:flutter/material.dart';
import 'package:office_hour/app/view/theme/light_theme.dart';
import 'package:office_hour/counter/counter.dart';
import 'package:office_hour/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
