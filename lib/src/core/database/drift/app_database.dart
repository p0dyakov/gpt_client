import 'package:ai_client/src/core/database/drift/connection/open_connection_stub.dart'
    if (dart.library.io) 'package:ai_client/src/core/database/drift/connection/open_connection_io.dart'
    if (dart.library.html) 'package:ai_client/src/core/database/drift/connection/open_connection_web.dart'
    as connection;
import 'package:ai_client/src/core/database/drift/tables/messages_table.dart';
import 'package:ai_client/src/feature/chat/model/ai_message.dart';
import 'package:dart_openai/openai.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Messages])
class AppDatabase extends _$AppDatabase {
  AppDatabase({required String name}) : super(connection.openConnection(name));

  @override
  int get schemaVersion => 1;
}
