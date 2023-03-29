import 'package:ai_client/src/core/di/shared_parent.dart';
import 'package:ai_client/src/feature/chat/bloc/chat_dependencies.dart';
import 'package:ai_client/src/feature/chat/database/chat_dao.dart';
import 'package:ai_client/src/feature/chat/database/chat_dao_interface.dart';
import 'package:ai_client/src/feature/chat/repository/chat_dependencies.dart';
import 'package:ai_client/src/feature/chat/repository/chat_repository.dart';
import 'package:ai_client/src/feature/chat/repository/chat_repository_interface.dart';

abstract class ChatDependencies implements ChatBlocDependencies {}

class ChatDependenciesModule<P extends SharedParent<P>>
    extends SharedBaseModule<ChatDependenciesModule<P>, P>
    implements ChatDependencies, ChatRepositoryDependencies {
  ChatDependenciesModule(super.parent);

  @override
  IChatDao get chatDao => shared(
        () => ChatDao(preferencesDriver),
      );

  @override
  IChatRepository get chatRepository => shared(
        () => ChatRepository(this),
      );
}
