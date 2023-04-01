import 'package:dart_openai/openai.dart';

class OpenAIMessage extends OpenAIChatCompletionChoiceMessageModel {
  OpenAIMessage({required super.role, required super.content});

  OpenAIMessage.fromDb({required super.role, required super.content});
}
