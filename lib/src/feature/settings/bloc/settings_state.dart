part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.idle({
    required SettingsData data,
  }) = SettingsStateIdle;
  const factory SettingsState.loading({
    required SettingsData data,
  }) = SettingsStateLoading;
  const factory SettingsState.updatedSuccessfully({
    required SettingsData data,
  }) = SettingsStateUpdatedSuccessfully;
  const factory SettingsState.error({
    required SettingsData data,
    required String description,
  }) = SettingsStateError;
}
