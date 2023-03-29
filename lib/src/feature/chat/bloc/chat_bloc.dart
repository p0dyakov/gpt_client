import 'dart:async';

import 'package:ai_client/src/feature/chat/bloc/chat_dependencies.dart';
import 'package:ai_client/src/feature/chat/model/chat_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_bloc/stream_bloc.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends StreamBloc<ChatEvent, ChatState> {
  final ChatBlocDependencies _dependencies;

  ChatBloc(this._dependencies)
      : super(
          _Idle(
            data: _dependencies.chatRepository.currentData(),
          ),
        );

  @override
  Stream<ChatState> mapEventToStates(ChatEvent event) => event.when(
        sendMessage: _sendMessage,
        clearMessages: _clearMessages,
      );

  Stream<ChatState> _sendMessage(String text) => _performMutation(
        () => _dependencies.chatRepository.sendMessage(text),
      );

  Stream<ChatState> _clearMessages() => _performMutation(
        () => _dependencies.chatRepository.clearMessages(),
      );

  ChatData get _data => state.data;

  Stream<ChatState> _performMutation(
    FutureOr<void> Function() body,
  ) async* {
    yield ChatState.loading(data: _data);
    try {
      await body();
      yield _LoadSuccess(
        data: _dependencies.chatRepository.currentData(),
      );
    } on Object catch (e) {
      yield _Failure(
        data: _data,
        error: e.toString(),
      );
      rethrow;
    } finally {
      yield _Idle(data: _data);
    }
  }
}
