import 'package:gpt_client/src/feature/settings/enum/app_theme.dart';
import 'package:gpt_client/src/feature/settings/model/settings_data.dart';

abstract class ISettingsRepository {
  SettingsData currentData();

  Future<void> setTheme(AppTheme value);
}
