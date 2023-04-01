import 'package:arbor/arbor.dart';
import 'package:gpt_client/src/core/repository/configuration_repository.dart';
import 'package:gpt_client/src/feature/app/di/app_feature_dependencies.dart';
import 'package:gpt_client/src/feature/chat/di/chat_dependencies.dart';
import 'package:gpt_client/src/feature/settings/di/settings_dependencies.dart';
import 'package:mark/mark.dart';

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
  ChatDependencies get chat;
}
