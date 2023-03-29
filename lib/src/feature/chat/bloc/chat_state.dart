part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.idle({
    required ChatData data,
  }) = _Idle;
  const factory ChatState.loadFailure({
    required ChatData data,
    required String error,
  }) = _Failure;
  const factory ChatState.loadSuccess({
    required ChatData data,
  }) = _LoadSuccess;
  const factory ChatState.loading({
    required ChatData data,
  }) = _Loading;
}
