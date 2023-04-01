import 'package:ai_client/src/core/di/shared_parent.dart';
import 'package:ai_client/src/feature/settings/bloc/settings_dependencies.dart';
import 'package:ai_client/src/feature/settings/database/settings_dao.dart';
import 'package:ai_client/src/feature/settings/repository/settings_repository.dart';
import 'package:ai_client/src/feature/settings/repository/settings_repository_dependencies.dart';
import 'package:ai_client/src/feature/settings/repository/settings_repository_interface.dart';

abstract class SettingsDependencies implements SettingsBlocDependencies {}

class SettingsDependenciesModule<P extends SharedParent<P>>
    extends SharedBaseModule<SettingsDependenciesModule<P>, P>
    implements SettingsDependencies, SettingsRepositoryDependencies {
  SettingsDependenciesModule(super.parent);

  @override
  ISettingsDao get settingsDao => shared(
        () => SettingsDao(preferencesDriver),
      );

  @override
  ISettingsRepository get settingsRepository => shared(
        () => SettingsRepository(this),
      );
}
