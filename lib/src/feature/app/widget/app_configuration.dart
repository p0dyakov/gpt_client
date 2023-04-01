import 'package:flutter/material.dart';
import 'package:gpt_client/src/core/extension/extensions.dart';
import 'package:gpt_client/src/core/gen/l10n/app_localizations.g.dart';
import 'package:gpt_client/src/core/resources/dark_theme.dart';
import 'package:gpt_client/src/core/resources/light_theme.dart';
import 'package:gpt_client/src/core/router/app_router.dart';
import 'package:gpt_client/src/feature/app/widget/app_router_builder.dart';
import 'package:gpt_client/src/feature/settings/widget/scope/settings_scope.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeMode = SettingsScope.themeModeOf(context);

    return AppRouterBuilder(
      createRouter: (context) => AppRouter(),
      builder: (context, parser, delegate) => MaterialApp.router(
        routeInformationParser: parser,
        routerDelegate: delegate,
        onGenerateTitle: (context) => context.localized.appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
      ),
    );
  }
}
