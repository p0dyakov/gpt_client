import 'package:ai_client/src/feature/app/logic/main_runner.dart';
import 'package:ai_client/src/feature/app/ai_client_app.dart';

void sharedRun(InitializationHooks initializationHooks) => MainRunner.run(
      appBuilder: (
        initializationData,
        observer,
        logger,
        configurationRepository,
      ) =>
          AiClientApp(
        initializationData: initializationData,
        observer: observer,
        logger: logger,
        configurationRepository: configurationRepository,
      ),
      hooks: initializationHooks,
    );
