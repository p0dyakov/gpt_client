part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage(String text) = _SendMessage;
  const factory ChatEvent.clearMessages() = _ClearMessages;
}
