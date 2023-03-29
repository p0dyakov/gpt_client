import 'package:ai_client/src/feature/chat/database/chat_dao_interface.dart';

abstract class ChatDaoDependency {
  IChatDao get chatDao;
}
