import 'package:ai_client/src/feature/chat/database/chat_dao_dependencies.dart';
import 'package:ai_client/src/feature/chat/repository/chat_repository_interface.dart';

abstract class ChatRepositoryDependencies implements ChatDaoDependency {}

abstract class ChatRepositoryDependency {
  IChatRepository get chatRepository;
}