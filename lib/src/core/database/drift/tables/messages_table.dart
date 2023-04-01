import 'package:ai_client/src/feature/chat/model/ai_message.dart';
import 'package:dart_openai/openai.dart';
import 'package:drift/drift.dart';

@UseRowClass(OpenAIMessage, constructor: 'fromDb')
class Messages extends Table {
  TextColumn get role => textEnum<OpenAIChatMessageRole>()();
  TextColumn get content => text()();
}
