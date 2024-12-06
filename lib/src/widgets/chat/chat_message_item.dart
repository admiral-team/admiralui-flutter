import 'package:admiralui_flutter/admiralui_flutter.dart';

class ChatMessageItem extends ChatMessageBase {
  ChatMessageItem({
    required this.direction,
    required this.text,
    required this.time,
    this.name,
    this.chatStatus = ChatStatus.none,
  });

  final ChatDirection direction;
  final String text;
  final String time;
  final String? name;
  final ChatStatus chatStatus;
}
