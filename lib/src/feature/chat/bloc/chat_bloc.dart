import 'dart:async';

import 'package:dart_openai/openai.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpt_client/src/feature/chat/bloc/chat_dependencies.dart';
import 'package:gpt_client/src/feature/chat/model/chat_data.dart';
import 'package:stream_bloc/stream_bloc.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends StreamBloc<ChatEvent, ChatState> {
  final ChatBlocDependencies _dependencies;

  ChatBloc(this._dependencies)
      : super(
          ChatState.idle(
            data: _dependencies.chatRepository.currentData(),
          ),
        ) {
    add(const _GetStoredMessages());
  }

  ChatData get _data => state.data;

  @override
  Stream<ChatState> mapEventToStates(ChatEvent event) => event.when(
        sendMessage: _sendMessage,
        clearMessages: _clearMessages,
        getStoredMessages: _getStoredMessages,
      );

  Stream<ChatState> _getStoredMessages() => _performMutation(
        () => _dependencies.chatRepository.getStoredMessages(),
      );

  Stream<ChatState> _sendMessage(String text) => _performMutation(
        () => _dependencies.chatRepository.sendMessage(text),
      );

  Stream<ChatState> _clearMessages() => _performMutation(
        () => _dependencies.chatRepository.clearMessages(),
      );

  Stream<ChatState> _performMutation(
    FutureOr<void> Function() body,
  ) async* {
    yield ChatState.loading(data: _data);
    try {
      await body();
      yield ChatState.updatedSuccessfully(
        data: _dependencies.chatRepository.currentData(),
      );
    } on RequestFailedException catch (e) {
      yield ChatState.error(
        data: _data,
        error: e.message,
      );
    } on Object catch (e) {
      yield ChatState.error(
        data: _data,
        error: e.toString(),
      );
    }
  }
}
