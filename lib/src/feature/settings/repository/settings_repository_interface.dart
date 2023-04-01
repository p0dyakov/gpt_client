import 'package:ai_client/src/feature/settings/enum/app_theme.dart';
import 'package:ai_client/src/feature/settings/model/settings_data.dart';

abstract class ISettingsRepository {
  SettingsData currentData();

  Future<void> setTheme(AppTheme value);
}
