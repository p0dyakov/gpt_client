import 'package:ai_client/src/core/database/drift/app_database.dart';
import 'package:ai_client/src/core/database/drift/tables/messages_table.dart';
import 'package:ai_client/src/feature/chat/database/chat_dao_interface.dart';
import 'package:ai_client/src/feature/chat/model/ai_message.dart';
import 'package:drift/drift.dart';

part 'chat_dao.g.dart';

@DriftAccessor(tables: [Messages])
class ChatDao extends DatabaseAccessor<AppDatabase>
    with _$ChatDaoMixin
    implements IChatDao {
  ChatDao(super.db);

  @override
  Future<List<OpenAIMessage>> get storedMessages async =>
      select(messages).get();

  @override
  Future<void> addMessage(OpenAIMessage message) => into(messages).insert(
        MessagesCompanion.insert(
          role: message.role,
          content: message.content,
        ),
      );

  @override
  Future<void> clearMessages() => messages.deleteAll();
}
