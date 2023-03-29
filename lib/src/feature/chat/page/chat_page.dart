import 'package:ai_client/src/feature/chat/bloc/chat_bloc.dart';
import 'package:ai_client/src/feature/chat/widget/scope/chat_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => ChatScope(
        child: Scaffold(
          body: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) => ui.Chat(
              messages: state.data.messages,
              onSendPressed: (partialText) => ChatScope.sendMessage(
                context,
                partialText.text,
              ),
              user: state.data.user,
              theme: ui.DefaultChatTheme(
                inputBorderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
      );
}
