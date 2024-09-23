import 'package:admiralui_flutter/admiralui_flutter.dart';

class ChatMessageItem {
  ChatMessageItem({
    required this.direction,
    required this.text,
    required this.time,
    this.type = ChatType.message
  });

  final ChatDirection direction;
  final String text;
  final String time;
  final ChatType type;
}

enum ChatType {
  message,
  textOperation,
  errorOperation
}
