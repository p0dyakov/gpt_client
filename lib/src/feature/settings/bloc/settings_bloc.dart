import 'package:ai_client/src/feature/settings/bloc/settings_dependencies.dart';
import 'package:ai_client/src/feature/settings/enum/app_theme.dart';
import 'package:ai_client/src/feature/settings/model/settings_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_bloc/stream_bloc.dart';

part 'settings_bloc.freezed.dart';
part 'settings_state.dart';
part 'settings_event.dart';

class SettingsBloc extends StreamBloc<SettingsEvent, SettingsState> {
  final SettingsBlocDependencies _dependencies;

  SettingsBloc(this._dependencies)
      : super(
          SettingsState.idle(
            data: _dependencies.settingsRepository.currentData(),
          ),
        );

  SettingsData get _data => state.data;

  @override
  Stream<SettingsState> mapEventToStates(SettingsEvent event) => event.when(
        setTheme: _setTheme,
      );

  Stream<SettingsState> _setTheme(AppTheme theme) => _performMutation(
        () => _dependencies.settingsRepository.setTheme(theme),
      );

  Stream<SettingsState> _performMutation(
    Future<void> Function() body,
  ) async* {
    yield SettingsState.loading(data: _data);
    try {
      await body();
      yield SettingsState.updatedSuccessfully(
        data: _dependencies.settingsRepository.currentData(),
      );
    } on Object catch (e) {
      yield SettingsState.error(
        data: _data,
        description: e.toString(),
      );
      rethrow;
    } finally {
      yield SettingsState.idle(data: _data);
    }
  }
}
