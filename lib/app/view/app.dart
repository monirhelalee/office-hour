import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_hour/app/core/service_locator.dart';
import 'package:office_hour/app/view/router/app_router.dart';
import 'package:office_hour/app/view/theme/theme.dart';
import 'package:office_hour/app/view/theme/theme_cubit.dart';
import 'package:office_hour/l10n/l10n.dart';
import 'package:pocketbase/pocketbase.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    sl.get<PocketBase>().authStore.onChange.listen((value) {
      AppRouter.router.refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.theme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
