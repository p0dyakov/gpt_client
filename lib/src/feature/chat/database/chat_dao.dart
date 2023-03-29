import 'package:ai_client/src/feature/chat/database/chat_dao_interface.dart';
import 'package:typed_preferences/typed_preferences.dart';

class ChatDao extends TypedPreferencesDao implements IChatDao {
  ChatDao(super.driver);
}
