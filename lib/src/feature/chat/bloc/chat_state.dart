part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.idle({
    required ChatData data,
  }) = ChatStateIdle;
  const factory ChatState.error({
    required ChatData data,
    required String error,
  }) = ChatStateError;
  const factory ChatState.updatedSuccessfully({
    required ChatData data,
  }) = ChatStateUpdatedSuccessfully;
  const factory ChatState.loading({
    required ChatData data,
  }) = ChatStateLoading;
}
