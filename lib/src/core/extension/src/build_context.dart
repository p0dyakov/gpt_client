import 'package:ai_client/src/core/di/app_dependencies.dart';
import 'package:ai_client/src/core/gen/l10n/app_localizations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arbor/flutter_arbor.dart';
import 'package:mark/mark.dart';

extension BuildContextX on BuildContext {
  AppDependencies get _appDependencies => NodeScope.of<AppDependencies>(this);

  CoreDependencies get coreDependencies => _appDependencies.core;
  FeatureDependencies get featureDependencies => _appDependencies.feature;
  Logger get logger => coreDependencies.logger;

  AppLocalizations get localized => AppLocalizations.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
