import 'package:ai_client/src/feature/app/logic/main_runner.dart';
import 'package:ai_client/src/feature/app/logic/runner/runner_shared.dart'
    as runner;

class WebInitializationHooks extends InitializationHooks {
  const WebInitializationHooks();
}

void run() => runner.sharedRun(const WebInitializationHooks());
