import 'package:ai_client/src/feature/chat/model/chat_data.dart';

abstract class IChatRepository {
  ChatData currentData();

  Future<void> getStoredMessages();

  Future<void> sendMessage(String text);

  Future<void> clearMessages();
}
