import 'package:gpt_client/src/feature/app/gpt_client_app.dart';
import 'package:gpt_client/src/feature/app/logic/main_runner.dart';

void sharedRun(InitializationHooks initializationHooks) => MainRunner.run(
      appBuilder: (
        initializationData,
        observer,
        logger,
        configurationRepository,
      ) =>
          GptClientApp(
        initializationData: initializationData,
        observer: observer,
        logger: logger,
        configurationRepository: configurationRepository,
      ),
      hooks: initializationHooks,
    );
