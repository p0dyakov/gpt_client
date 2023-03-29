import 'package:ai_client/src/feature/chat/model/chat_data.dart';
import 'package:ai_client/src/feature/chat/repository/chat_dependencies.dart';
import 'package:ai_client/src/feature/chat/repository/chat_repository_interface.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatRepository implements IChatRepository {
  final ChatRepositoryDependencies _dependencies;
  final _user = const types.User(id: 'user');
  final _ai = const types.User(id: 'ai');
  final List<types.Message> _messages = [];

  ChatRepository(this._dependencies) {
    OpenAI.apiKey = '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';
  }

  @override
  ChatData currentData() => ChatData(
        messages: [],
        ai: _ai,
        user: _user,
      );

  @override
  Future<void> sendMessage(String text) async {
    _addMessage(
      types.TextMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: text,
      ),
    );

    final chatCompletion = await OpenAI.instance.chat.create(
      model: 'gpt-3.5-turbo',
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: text,
          role: 'user',
        ),
      ],
    );

    _addMessage(
      types.TextMessage(
        author: _ai,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: chatCompletion.choices.first.message.content,
      ),
    );
  }

  @override
  Future<void> clearMessages() async {}

  void _addMessage(types.Message message) => _messages.insert(0, message);
}
