import 'package:gpt_client/src/feature/chat/model/open_ai_message.dart';

abstract class IChatDao {
  Future<List<OpenAIMessage>> get storedMessages;

  Future<void> addMessage(OpenAIMessage message);

  Future<void> clearMessages();
}
