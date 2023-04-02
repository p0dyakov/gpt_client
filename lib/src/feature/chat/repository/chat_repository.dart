import 'package:dart_openai/openai.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:gpt_client/src/feature/chat/model/chat_data.dart';
import 'package:gpt_client/src/feature/chat/model/open_ai_message.dart';
import 'package:gpt_client/src/feature/chat/repository/chat_repository_dependencies.dart';
import 'package:gpt_client/src/feature/chat/repository/chat_repository_interface.dart';
import 'package:uuid/uuid.dart';

class ChatRepository implements IChatRepository {
  final ChatRepositoryDependencies _dependencies;

  ChatRepository(this._dependencies) {
    OpenAI.apiKey = _dependencies.environmentDao.openAIApiKey;
  }

  final _model = 'gpt-3.5-turbo';
  final _user = const types.User(id: 'user');
  final _assistant = const types.User(id: 'assistant');
  List<types.Message> _uiMessage = [];
  List<OpenAIMessage> _messages = [];

  @override
  ChatData currentData() => ChatData(
        messages: _uiMessage,
        assistant: _assistant,
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

    final userMessage = OpenAIMessage(
      content: text,
      role: OpenAIChatMessageRole.user,
    );
    _messages.add(userMessage);
    await _dependencies.chatDao.addMessage(userMessage);

    final chatCompletion = await OpenAI.instance.chat.create(
      model: _model,
      messages: _messages,
    );

    final aiMessage = OpenAIMessage(
      content: chatCompletion.choices.last.message.content,
      role: chatCompletion.choices.last.message.role,
    );
    _messages.add(aiMessage);
    await _dependencies.chatDao.addMessage(aiMessage);

    _addMessage(
      types.TextMessage(
        author: _assistant,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: aiMessage.content,
      ),
    );
  }

  @override
  Future<void> clearMessages() async {
    _uiMessage.clear();
    _messages.clear();
    await _dependencies.chatDao.clearMessages();
  }

  void _addMessage(types.Message message) => _uiMessage.insert(0, message);

  @override
  Future<void> getStoredMessages() async {
    _messages = await _dependencies.chatDao.storedMessages;
    _uiMessage = _messages.reversed
        .map(
          (m) => types.TextMessage(
            author: m.role == OpenAIChatMessageRole.user ? _user : _assistant,
            id: const Uuid().v4(),
            text: m.content,
          ),
        )
        .toList();
  }
}
