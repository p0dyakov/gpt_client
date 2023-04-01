import 'package:dart_openai/openai.dart';
import 'package:drift/drift.dart';
import 'package:gpt_client/src/feature/chat/model/open_ai_message.dart';

@UseRowClass(OpenAIMessage, constructor: 'fromDb')
class Messages extends Table {
  TextColumn get role => textEnum<OpenAIChatMessageRole>()();
  TextColumn get content => text()();
}
