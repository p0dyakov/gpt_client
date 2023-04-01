import 'package:ai_client/src/feature/settings/database/settings_dao.dart';
import 'package:ai_client/src/feature/settings/repository/settings_repository_interface.dart';

abstract class SettingsRepositoryDependency {
  ISettingsRepository get settingsRepository;
}

abstract class SettingsRepositoryDependencies
    implements SettingsDaoDependency {}
