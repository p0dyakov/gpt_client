import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_data.freezed.dart';

@freezed
class ChatData with _$ChatData {
  factory ChatData({
    required List<Message> messages,
    required User ai,
    required User user,
  }) = _ChatData;
}
