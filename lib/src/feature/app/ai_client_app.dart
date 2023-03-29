import 'package:ai_client/src/core/di/app_dependencies.dart';
import 'package:ai_client/src/core/repository/configuration_repository.dart';
import 'package:ai_client/src/feature/app/bloc/initialization_bloc.dart';
import 'package:ai_client/src/feature/app/di/app_dependencies.dart';
import 'package:ai_client/src/feature/app/widget/app_configuration.dart';
import 'package:ai_client/src/feature/app/widget/app_lifecycle_scope.dart';
import 'package:ai_client/src/feature/settings/widget/scope/settings_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arbor/flutter_arbor.dart';
import 'package:mark/mark.dart';

class AiClientApp extends StatelessWidget {
  final InitializationData initializationData;
  final ArborObserver observer;
  final Logger logger;
  final IConfigurationRepository configurationRepository;

  const AiClientApp({
    required this.initializationData,
    required this.observer,
    required this.logger,
    required this.configurationRepository,
    super.key,
  });

  @override
  Widget build(BuildContext context) => NodeScope<AppDependencies>(
        create: (context) => AppDependenciesTree(
          sharedPreferences: initializationData.sharedPreferences,
          observer: observer,
          logger: logger,
          configurationRepository: configurationRepository,
        ),
        child: const SettingsScope(
          child: AppLifecycleScope(
            child: AppConfiguration(),
          ),
        ),
      );
}
