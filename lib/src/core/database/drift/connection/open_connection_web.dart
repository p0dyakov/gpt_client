import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:ai_client/src/feature/app/database/drift_logger.dart';

QueryExecutor openConnection(String name) => WebDatabase(
      name,
      logStatements: IDriftLogger.shouldLog,
    );
