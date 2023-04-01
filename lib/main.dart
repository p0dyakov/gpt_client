import 'package:gpt_client/src/feature/app/logic/runner/runner_stub.dart'
    if (dart.library.io) 'package:gpt_client/src/feature/app/logic/runner/runner_io.dart'
    if (dart.library.html) 'package:gpt_client/src/feature/app/logic/runner/runner_web.dart'
    as runner;

void main() => runner.run();
