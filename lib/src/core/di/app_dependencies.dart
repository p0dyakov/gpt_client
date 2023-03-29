import 'package:arbor/arbor.dart';
import 'package:mark/mark.dart';
import 'package:ai_client/src/core/repository/configuration_repository.dart';
import 'package:ai_client/src/feature/app/di/app_feature_dependencies.dart';
import 'package:ai_client/src/feature/settings/di/settings_dependencies.dart';

abstract class AppDependencies implements Lifecycle {
  CoreDependencies get core;
  FeatureDependencies get feature;
}

abstract class CoreDependencies {
  Logger get logger;
  IConfigurationRepository get configurationRepository;
}

abstract class FeatureDependencies {
  AppFeatureDependencies get app;
  SettingsDependencies get settings;
}
