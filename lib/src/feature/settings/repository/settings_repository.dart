import 'package:ai_client/src/feature/settings/enum/app_theme.dart';
import 'package:ai_client/src/feature/settings/model/settings_data.dart';
import 'package:ai_client/src/feature/settings/repository/settings_repository_dependencies.dart';
import 'package:ai_client/src/feature/settings/repository/settings_repository_interface.dart';
import 'package:pure/pure.dart';

class SettingsRepository implements ISettingsRepository {
  final SettingsRepositoryDependencies _dependencies;

  SettingsRepository(this._dependencies);

  AppTheme? get _theme => AppTheme.values.byName.nullable(
        _dependencies.settingsDao.themeMode.value,
      );

  @override
  SettingsData currentData() => SettingsData(
        theme: _theme ?? AppTheme.system,
      );

  @override
  Future<void> setTheme(AppTheme value) =>
      _dependencies.settingsDao.themeMode.setValue(value.name);
}
