import 'package:ai_client/src/core/extension/extensions.dart';
import 'package:ai_client/src/core/widget/bloc_scope.dart';
import 'package:ai_client/src/feature/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

List<types.Message> _messages(ChatState state) => state.data.messages;

class ChatScope extends StatelessWidget {
  final Widget child;

  const ChatScope({
    required this.child,
    super.key,
  });

  static const BlocScope<ChatEvent, ChatState, ChatBloc> _scope = BlocScope();

  /* --- Data --- */

  static ScopeData<List<types.Message>> get messagesOf =>
      _scope.select(_messages);

  /* --- Methods --- */

  static void sendMessage(BuildContext context, String text) {
    _scope.add(context, ChatEvent.sendMessage(text));
  }

  static void clearMessage(BuildContext context) {
    _scope.add(context, const ChatEvent.clearMessages());
  }

  /* --- Build --- */

  @override
  Widget build(BuildContext context) => BlocProvider<ChatBloc>(
        create: (context) => ChatBloc(
          context.featureDependencies.chat,
        ),
        child: child,
      );
}
