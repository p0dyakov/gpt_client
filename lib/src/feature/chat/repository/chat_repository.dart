import 'package:ai_client/src/feature/chat/model/chat_data.dart';
import 'package:ai_client/src/feature/chat/repository/chat_dependencies.dart';
import 'package:ai_client/src/feature/chat/repository/chat_repository_interface.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatRepository implements IChatRepository {
  final ChatRepositoryDependencies _dependencies;

  ChatRepository(this._dependencies) {
    OpenAI.apiKey = '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';
  }

  final _user = const types.User(id: 'user');
  final _ai = const types.User(id: 'ai');
  final List<types.Message> _uiMessages = [];
  final List<OpenAIChatCompletionChoiceMessageModel> _messages = [];

  @override
  ChatData currentData() =>
      ChatData(messages: _uiMessages, ai: _ai, user: _user);

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

    _messages.add(
      OpenAIChatCompletionChoiceMessageModel(
        content: text,
        role: OpenAIChatMessageRole.user,
      ),
    );

    final chatCompletion = await OpenAI.instance.chat.create(
      model: 'gpt-3.5-turbo',
      messages: _messages,
    );

    _messages.add(chatCompletion.choices.last.message);

    _addMessage(
      types.TextMessage(
        author: _ai,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: chatCompletion.choices.last.message.content,
      ),
    );
  }

  @override
  Future<void> clearMessages() async {
    _uiMessages.clear();
    _messages.clear();
  }

  void _addMessage(types.Message message) => _uiMessages.insert(0, message);
}
