import 'package:ai_client/src/core/di/shared_parent.dart';
import 'package:ai_client/src/core/logic/identity_logging_mixin.dart';
import 'package:flutter/foundation.dart';
import 'package:mark/mark.dart';

abstract class IDriftLogger {
  static const bool shouldLog = !kReleaseMode;

  void logQuery(String string);
}

abstract class DriftLoggerDependencies implements LoggerDependency {}

class DriftLogger with IdentityLoggingMixin implements IDriftLogger {
  final DriftLoggerDependencies _dependencies;

  DriftLogger(this._dependencies);

  @override
  Logger get logger => _dependencies.logger;

  @override
  void logQuery(String string) {
    final parts = string.split('with args');
    final sql = parts.first.split('Drift: Sent').last.trim();
    final args = parts.last.trim();

    log(
      (b) => b
        ..write(sql)
        ..write(' with ')
        ..write(args),
    );
  }
}
