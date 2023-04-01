import 'package:gpt_client/src/core/database/environment_dao.dart';
import 'package:gpt_client/src/core/di/shared_parent.dart';
import 'package:gpt_client/src/feature/chat/bloc/chat_dependencies.dart';
import 'package:gpt_client/src/feature/chat/database/chat_dao.dart';
import 'package:gpt_client/src/feature/chat/database/chat_dao_interface.dart';
import 'package:gpt_client/src/feature/chat/repository/chat_repository.dart';
import 'package:gpt_client/src/feature/chat/repository/chat_repository_dependencies.dart';
import 'package:gpt_client/src/feature/chat/repository/chat_repository_interface.dart';

abstract class ChatDependencies implements ChatBlocDependencies {}

class ChatDependenciesModule<P extends SharedParent<P>>
    extends SharedBaseModule<ChatDependenciesModule<P>, P>
    implements ChatDependencies, ChatRepositoryDependencies {
  ChatDependenciesModule(super.parent);

  @override
  IChatDao get chatDao => shared(
        () => ChatDao(database),
      );

  @override
  IChatRepository get chatRepository => shared(
        () => ChatRepository(this),
      );

  @override
  IEnvironmentDao get environmentDao => shared(EnvironmentDao.new);
}
